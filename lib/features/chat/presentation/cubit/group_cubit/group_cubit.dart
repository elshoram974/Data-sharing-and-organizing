import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/group_chat_screen.dart';

part 'group_state.dart';

class GroupCubit extends Cubit<GroupState> {
  GroupCubit() : super(const GroupInitial()) {
    _getFloatingButtonPlace();
  }
  late double top;
  bool isOpened = false;

  int currentScreen = 0;

  double _dragPositionX = 0.0;

  _getFloatingButtonPlace() {
    top = 0;
    emit(GroupChangeButtonPlaceState(top));
  }

  void onPanUpdate(DragUpdateDetails details, BuildContext _) {
    top += details.delta.dy;
    final double height = MediaQuery.of(_).size.height - 180;
    if (top < 0) {
      top = 0;
    } else if (top > height) {
      top = height;
    }
    emit(GroupChangeButtonPlaceState(top));
  }

  void onHorizontalDragStart(DragStartDetails d) =>
      _dragPositionX = d.localPosition.dx;

  void openFloatingButtonByTap() {
    isOpened = !isOpened;
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
  const Center(child: Text('Bot screen')),
  const GroupChatScreen(),
];
