import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/user_home/presentation/cubit/user_notification_cubit/user_notification_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/repositories/init_group_repo.dart';
import '../../screens/group_bot_screen.dart';
import '../../screens/group_chat_screen.dart';

part 'group_state.dart';

bool isGroupScreenOpened = false;

class GroupCubit extends Cubit<GroupState> {
  final GroupInitRepositories initRepo;
  final GroupHomeEntity group;
  GroupCubit(this.initRepo, this.group) : super(const GroupInitial()) {
    isGroupScreenOpened = true;
    makeSeenTGroup(group.id);
    print(group.id);
  }

  late double top = initRepo.getButtonPlace();

  bool isOpened = false;

  late int currentScreen = group.screen;

  double _dragPositionX = 0.0;

  late final bool isAdmin = group.memberEntity.isAdmin;

  void onPanUpdate(DragUpdateDetails details, BuildContext _) async {
    top += details.delta.dy;
    final double height = MediaQuery.sizeOf(_).height - 180;
    if (top < 0) {
      top = 0;
    } else if (top > height) {
      top = height;
    }
    await initRepo.saveButtonPlace(top);
    emit(GroupChangeButtonPlaceState(top));
  }

  void onHorizontalDragStart(DragStartDetails d) =>
      _dragPositionX = d.localPosition.dx;

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

  @override
  Future<void> close() {
    isGroupScreenOpened = false;
    return super.close();
  }
}

final List<Widget> screens = [
  const GroupBOTScreen(),
  const GroupChatScreen(),
];

Future<void> makeSeenTGroup(int groupId) async {
  await sl.get<GroupInitRepositories>().makeSeenToGroup(groupId);
  ProviderDependency.userHome.updateUI();
  if (isNotificationScreenOpened) {
    ProviderDependency.userNotification.updateUI();
  }
}
