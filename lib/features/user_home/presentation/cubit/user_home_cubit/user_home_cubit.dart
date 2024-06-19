import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/errors/failure_body.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/http_exception_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/handle_status_emit.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:data_sharing_organizing/core/utils/functions/sort_groups_by_last_activity_time.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';

import '../../../../chat/data/models/member_model.dart';
import '../../../../chat/domain/entities/activity_entity.dart';
import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/repositories/home_repositories.dart';
import '../../../domain/usecases/home_use_case/exit_from_some_groups.dart';
import '../../../domain/usecases/home_use_case/get_groups.dart';
import '../../../domain/usecases/home_use_case/mark_as_un_read.dart';
import '../main_cubit/user_main_cubit.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit({
    required this.homeRepo,
    required this.getGroupsUseCase,
    required this.exitFromSomeGroups,
    required this.markAsUnReadUsecase,
    required this.isMyGroups,
  }) : super(const UserHomeInitial()) {
    getGroups();
  }
  final HomeRepositories homeRepo;
  final GetGroupsUseCase getGroupsUseCase;
  final ExitFromSomeGroups exitFromSomeGroups;
  final MarkAsUnRead markAsUnReadUsecase;
  final bool isMyGroups;

  final UserMainCubit userMain = ProviderDependency.userMain;
  final List<GroupHomeEntity> currentGroups = [];
  final List<GroupHomeEntity> selectedGroups = [];

  // * Update UI
  int _i = 0;
  void updateUI() {
    currentGroups.clear();
    currentGroups.addAll(homeRepo.getLocalGroups());
    emit(UpdateUI(_i++));
  }

  // * Update group here
  Future<void> updateLastActivityUI(ActivityEntity activity, int screen) async {
    GroupHomeEntity temp = currentGroups.first;
    for (int i = 0; i < currentGroups.length; i++) {
      if (activity.groupId == currentGroups[i].groupId) {
        temp = currentGroups[i].copyWith(
          lastActivity: activity,
          screen: screen,
          unReadCounter: (currentGroups[i].unReadCounter ?? 0) + 1,
        );
        currentGroups[i] = temp;
        break;
      }
    }

    currentGroups.sort(compareLastActivity);

    emit(UserHomeUpdateGroup(temp));
  }

  // * Update group inside it
  Future<void> updateScreen(int groupId, int screen) async {
    GroupHomeEntity temp = GroupHomeEntity.newEmpty();
    for (int i = 0; i < currentGroups.length; i++) {
      if (groupId == currentGroups[i].groupId) {
        temp = currentGroups[i] = currentGroups[i].copyWith(screen: screen);
        break;
      }
    }

    await homeRepo.updateScreen(groupId, screen);

    emit(UserHomeUpdateGroup(temp));
  }

  Future<void> updateGroupLocally(GroupHomeEntity groupUpdated) async {
    for (int i = 0; i < currentGroups.length; i++) {
      if (groupUpdated.groupId == currentGroups[i].groupId) {
        currentGroups[i] = groupUpdated;
        break;
      }
    }

    await homeRepo.updateGroupLocally(groupUpdated);

    currentGroups.sort(compareLastActivity);

    emit(UserHomeUpdateGroup(groupUpdated));
  }

  // * MarkAsUnRead from groups
  Future<void> _markAsUnRead() async {
    final Status<Iterable<int>> status =
        await markAsUnReadUsecase(selectedGroups);

    if (status is Success<Iterable<int>>) {
      for (int i = 0; i < selectedGroups.length; i++) {
        final int listIndex = currentGroups.indexOf(selectedGroups[i]);
        currentGroups[listIndex] =
            currentGroups[listIndex].copyWith(unReadCounter: 0);
      }
      emit(HomeSuccessState(currentGroups));
      _makeAllSelectedOrNot(false);
    } else if (status is Failure<Iterable<int>>) {
      _failureStatus(status.failure, true);
    }
    EasyLoading.dismiss();
  }

  // * exit from groups
  Future<void> exitGroups() {
    final BuildContext context = AppRoute.key.currentContext!;
    String groupsName = '';
    for (var e in selectedGroups) {
      groupsName += "'${e.groupName}' - ";
    }
    groupsName = groupsName.substring(0, groupsName.length - 3);
    return ShowCustomDialog.warning(
      context,
      body: S.of(context).confirmExitGroups(groupsName),
      textConfirm: S.of(context).exitGroups,
      onPressConfirm: () async {
        emit(const GetGroupsLoadingState(true));
        EasyLoading.show(dismissOnTap: false);
        final Status<bool> status = await exitFromSomeGroups(
            (removedGroups: selectedGroups, user: userMain.user));

        if (status is Success<bool>) {
          currentGroups.removeWhere((e) => selectedGroups.contains(e));
          _makeAllSelectedOrNot(false);
          emit(HomeSuccessState(currentGroups));
          if (currentGroups.length < 10) getGroups();
        } else if (status is Failure<bool>) {
          _failureStatus(status.failure, true);
        }
        await EasyLoading.dismiss();
        if (context.mounted) context.pop();
      },
    );
  }

  Future<void> exitGroup(GroupHomeEntity remove) {
    final BuildContext context = AppRoute.key.currentContext!;
    return ShowCustomDialog.warning(
      context,
      body: S.of(context).confirmExitGroup(remove.groupName),
      textConfirm: S.of(context).exitGroup,
      onPressConfirm: () async {
        emit(const GetGroupsLoadingState(true));
        await handleStatusEmit<bool>(
          statusFunction: () => exitFromSomeGroups(
              (removedGroups: [remove], user: userMain.user)),
          successFunction: (_) {
            currentGroups.removeWhere((e) => remove.groupId == e.groupId);
            _makeAllSelectedOrNot(false);
            emit(HomeSuccessState(currentGroups));
            context.go(AppRoute.userHome);
          },
        );
      },
    );
  }

  // * Edit notification from groups
  Future<GroupHomeEntity> editNotification(
    NotificationEnum notify,
    GroupHomeEntity group,
  ) async {
    emit(const UserHomeInitial());
    GroupHomeEntity temp = group.copyWith(
      member: MemberModel.fromEntity(
        group.memberEntity.copyWith(notification: notify),
      ),
    );

    await handleStatusEmit<void>(
      statusFunction: () => homeRepo.editNotification(temp),
      successFunction: (_) {
        final int i =
            currentGroups.indexWhere((e) => e.groupId == group.groupId);
        currentGroups[i] = temp;
        emit(UserHomeUpdateGroup(temp));
      },
      failureFunction: (f) => temp = group,
    );
    _makeAllSelectedOrNot(false);
    return temp;
  }

  // * GetGroups
  Future<void> getGroups([bool inFirst = true, int page = 1]) async {
    emit(GetGroupsLoadingState(inFirst));
    Status<List<GroupHomeEntity>>? status;
    getGroupsUseCase((
      user: userMain.user,
      getMyGroups: isMyGroups,
    )).listen((tempStatus) {
      status = tempStatus;
      if (tempStatus is Success<List<GroupHomeEntity>>) {
        if (inFirst) {
          if (isSelected) _makeAllSelectedOrNot(false);
          currentGroups.clear();
        }
        currentGroups.addAll(tempStatus.data);
        currentGroups.sort(compareLastActivity);

        emit(HomeSuccessState(tempStatus.data));
        emit(GetGroupsLoadingState(inFirst));
      }
    }).onDone(() {
      if (status is Failure<List<GroupHomeEntity>>) {
        _failureStatus(
          (status as Failure<List<GroupHomeEntity>>).failure,
          inFirst,
        );
      } else {
        emit(HomeSuccessState(currentGroups));
      }
    });
  }

  // * when tap on tile
  void onTapGroup(GroupHomeEntity group) {
    if (isSelected) {
      onLongTapGroup(group);
    } else {
      AppRoute.key.currentContext?.push(AppRoute.group, extra: group);
    }
  }

  void onLongTapGroup(GroupHomeEntity group) =>
      _selectGroup(group, !group.isSelected);

  // * when tap on pop up item when select groups
  void onSelectPopUpItem(value) {
    switch (value) {
      case HomeSelectedPopUpItem.exitGroup:
        exitGroups();
      case HomeSelectedPopUpItem.markAsUnRead:
        _markAsUnRead();
      case HomeSelectedPopUpItem.selectAll:
      case HomeSelectedPopUpItem.deselectAll:
        _makeAllSelectedOrNot(!isAllSelected);
      case HomeSelectedPopUpItem.muteNotification:
        editNotification(NotificationEnum.withoutNotify, selectedGroups.first);
      case HomeSelectedPopUpItem.unmuteNotification:
        editNotification(NotificationEnum.notify, selectedGroups.first);
    }
  }

  // * helper functions
  void _failureStatus(FailureBody failure, bool showDialog) async {
    emit(HomeFailureState(failure.message));
    if (showDialog) {
      EasyLoading.showError(failure.message,
          duration: const Duration(seconds: 5));
      await Future.delayed(const Duration(seconds: 3));
      if (failure.httpExceptionType == HttpExceptionType.badResponse) {
        ProviderDependency.userMain
            .logoutWithoutDialog(AppRoute.key.currentContext!);
      }
    }
  }

  void _selectGroup(GroupHomeEntity group, bool makeSelected) {
    final GroupHomeEntity replaced = group.copyWith(isSelected: makeSelected);
    if (makeSelected) {
      selectedGroups.add(replaced);
    } else {
      selectedGroups.remove(group);
    }
    final int index = currentGroups.indexOf(group);
    currentGroups[index] = replaced;

    emit(UserHomeSelectGroups([group], makeSelected));
  }

  void _makeAllSelectedOrNot(bool makeSelected) {
    for (int i = 0; i < currentGroups.length; i++) {
      currentGroups[i] = currentGroups[i].copyWith(isSelected: makeSelected);
    }

    selectedGroups.clear();
    if (makeSelected) selectedGroups.addAll(currentGroups);

    emit(UserHomeSelectGroups(currentGroups, makeSelected));
  }

  // * when go back
  bool onWillPop() {
    if (isSelected) {
      _makeAllSelectedOrNot(false);
      return false;
    }
    return true;
  }

  // * get functions
  bool get isSelected => selectedGroups.isNotEmpty;
  bool get isAllSelected => selectedGroups.length >= currentGroups.length;
}
