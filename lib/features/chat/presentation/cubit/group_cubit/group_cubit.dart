import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/repositories/init_group_repo.dart';
import '../../screens/group_bot_screen.dart';
import '../../screens/group_chat_screen.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  final GroupInitRepositories initRepo;
  GroupCubit(this.initRepo) : super(const GroupInitial());

  late double top = initRepo.getButtonPlace();

  bool isOpened = false;

  int currentScreen = 0;

  double _dragPositionX = 0.0;

  void onPanUpdate(DragUpdateDetails details, BuildContext _) async {
    top += details.delta.dy;
    final double height = MediaQuery.of(_).size.height - 180;
    if (top < 0) {
      top = 0;
    } else if (top > height) {
      top = height;
    }
    await initRepo.saveButtonPlace(top);
    emit(GroupChangeButtonPlaceState(top));
  }

  void onHorizontalDragStart(DragStartDetails d) => _dragPositionX = d.localPosition.dx;

  void openFloatingButtonByTap() {
    isOpened = !isOpened;
    emit(GroupOpenFloatingButtonState(isOpened));
  }

  void closeFloatingButton() {
    isOpened = false;
    emit(GroupOpenFloatingButtonState(isOpened));
  }

  void openFloatingButtonByDrag(DragUpdateDetails d) {
    final double delta = _dragPositionX - d.localPosition.dx;
    if (delta < 0) {
      // drag to right
      isOpened = true;
    } else {
      // drag to left
      isOpened = false;
    }
    emit(GroupOpenFloatingButtonState(isOpened));
  }

  void onChooseScreen(int chosenScreen) {
    currentScreen = chosenScreen;
    isOpened = false;
    emit(GroupChooseScreenState(currentScreen));
  }
}

final List<Widget> screens = [
  const GroupBOTScreen(),
  const GroupChatScreen(),
];
