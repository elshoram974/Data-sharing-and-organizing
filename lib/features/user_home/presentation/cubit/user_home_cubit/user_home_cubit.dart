import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/home_selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../domain/entities/group_home_entity.dart';
import '../../../domain/usecases/home_use_case/get_groups.dart';
import '../main_cubit/user_main_cubit.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit({
    required this.getGroupsUseCase,
  }) : super(const UserHomeInitial()) {
    getGroups();
  }
  final GetGroupsUseCase getGroupsUseCase;

  final UserMainCubit userMain = ProviderDependency.userMain;
  final List<GroupHomeEntity> currentGroups = [];
  final List<GroupHomeEntity> selectedGroups = [];

  // * GetGroups
  Future<void> getGroups([inFirst = true ,int page = 3]) async {
    emit(const GetGroupsLoadingState());
    final Status<List<GroupHomeEntity>> status = await getGroupsUseCase((page: page, user: userMain.user));
    if(inFirst) currentGroups.clear();
    if (status is Success<List<GroupHomeEntity>>) {
      currentGroups.addAll(status.data);
      emit(HomeSuccessState(status.data));
      debugPrint('groups: ${status.data}');
    } else if (status is Failure<List<GroupHomeEntity>>) {
      // currentGroups.addAll(groupsItems);
      currentGroups.addAll(status.data!);
      _failureStatus(status.error);
    }
  }

  // * when tap on tile
  void onTapGroup(GroupHomeEntity group) {
    if (isSelected) {
      onLongTapGroup(group);
    } else {
      // go to screen
    }
  }

  void onLongTapGroup(GroupHomeEntity group) =>
      _selectGroup(group, !group.isSelected);

  // * when tap on pop up item when select groups
  void onSelectPopUpItem(value) {
    switch (value) {
      case HomeSelectedPopUpItem.exitGroup:
        print('exitGroup');
      case HomeSelectedPopUpItem.markAsUnRead:
        print('markAsUnRead');
      case HomeSelectedPopUpItem.selectAll:
      case HomeSelectedPopUpItem.deselectAll:
        _makeAllSelectedOrNot(!isAllSelected);
      case HomeSelectedPopUpItem.muteNotification:
        print('muteNotification');
      case HomeSelectedPopUpItem.unmuteNotification:
        print('unmuteNotification');
    }
  }

  // * helper functions
  void _failureStatus(String error) {
    emit(HomeFailureState(error));
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
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
  bool get isAllSelected => selectedGroups.length == currentGroups.length;
}