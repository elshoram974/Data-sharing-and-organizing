import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/user_home/presentation/cubit/user_notification_cubit/user_notification_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../domain/repositories/init_group_repo.dart';
import '../../screens/group_bot_screen.dart';
import '../../screens/group_chat_screen.dart';

part 'group_state.dart';

bool isGroupScreenOpened = false;

class GroupCubit extends Cubit<GroupState> {
  final GroupInitRepositories initRepo;
  GroupHomeEntity group;
  GroupCubit(this.initRepo, this.group) : super(const GroupInitial()) {
    isGroupScreenOpened = true;
    makeSeenTGroup(group.groupId);
    getCurrentScreen();
    allowOpenGroup();
  }

  void getCurrentScreen() {
    if (group.discussion == GroupDiscussionType.notExist) {
      currentScreen = 0;
    } else {
      currentScreen = group.screen;
    }
  }

  void allowOpenGroup() async {
    if (group.status == GroupStatus.active) return;
    final BuildContext context = AppRoute.key.currentContext!;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        String body = S.of(context).groupIsCurrentlyInActive;
        if (group.statusMessage != null) body += "\n${group.statusMessage}";

        await ShowCustomDialog.warning(
          context,
          body: body,
          bodyAlign: TextAlign.center,
          textCancel: S.of(context).gotIt,
        );
        if (context.mounted) context.pop();
      },
    );
  }

  late double top = initRepo.getButtonPlace();

  bool isOpened = false;

  late int currentScreen;

  double _dragPositionX = 0.0;

  late final bool isAdmin = group.memberEntity.isAdmin;

  Future<void> updateGroup(GroupHomeEntity updatedGroup) async {
    group = updatedGroup;
    emit(GroupUpdateGroupDetails(updatedGroup));
    await ProviderDependency.userHome.updateGroupLocally(updatedGroup);
  }

  Future<void> editNotification(NotificationEnum notify) async {
    group = await ProviderDependency.userHome.editNotification(notify, group);
  }

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

  void onChooseScreen(int chosenScreen) async {
    currentScreen = chosenScreen;
    group = group.copyWith(screen: currentScreen);
    // await ProviderDependency.userHome
    //     .updateScreen(group.groupId, currentScreen);
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
