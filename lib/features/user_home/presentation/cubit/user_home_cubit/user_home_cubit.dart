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
import '../../../domain/usecases/home_use_case/exit_from_some_groups.dart';
import '../../../domain/usecases/home_use_case/get_groups.dart';
import '../main_cubit/user_main_cubit.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit({
    required this.getGroupsUseCase,
    required this.exitFromSomeGroups,
  }) : super(const UserHomeInitial()) {
    getGroups();
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }
  final GetGroupsUseCase getGroupsUseCase;
  final ExitFromSomeGroups exitFromSomeGroups;

  late final ScrollController scrollController;
  final UserMainCubit userMain = ProviderDependency.userMain;
  final List<GroupHomeEntity> currentGroups = [];
  final List<GroupHomeEntity> selectedGroups = [];

  @override
  Future<void> close() {
    scrollController.removeListener(_onScroll);
    scrollController.dispose();
    return super.close();
  }

  // * exit from groups
  Future<void> _exitGroups() async {
    emit(const GetGroupsLoadingState(true));
    EasyLoading.show(dismissOnTap: false);
    // await Future.delayed(Duration(seconds: 3));
    final Status<bool> status = await exitFromSomeGroups(
        (removedGroups: selectedGroups, user: userMain.user));

    if (status is Success<bool>) {
      currentGroups.removeWhere((e) => selectedGroups.contains(e));
      _makeAllSelectedOrNot(false);
      emit(HomeSuccessState(currentGroups));
      if (currentGroups.length < 10) getGroups();
      debugPrint('deleted: ${status.data}');
    } else if (status is Failure<bool>) {
      _failureStatus(status.error, true);
    }
    EasyLoading.dismiss();
  }

  // * GetGroups
  Future<void> getGroups([bool inFirst = true, int page = 1]) async {
    emit(GetGroupsLoadingState(inFirst));
    // await Future.delayed(Duration(seconds: 3));
    final Status<List<GroupHomeEntity>> status = await getGroupsUseCase((page: page, user: userMain.user));
    if (inFirst) {
      if (isSelected) _makeAllSelectedOrNot(false);
      _currentPage = 1;
      currentGroups.clear();
    }
    if (status is Success<List<GroupHomeEntity>>) {
      currentGroups.addAll(status.data);
      emit(HomeSuccessState(status.data));
      debugPrint('success groups: ${status.data}');
    } else if (status is Failure<List<GroupHomeEntity>>) {
      currentGroups.addAll(status.data!);
      debugPrint('failure groups: ${status.data}');
      _failureStatus(status.error, inFirst);
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
        _exitGroups();
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
  int _currentPage = 1;
  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (state is! GetGroupsLoadingState) {
        _currentPage++;
        getGroups(false, _currentPage);
      }
    }
  }

  void _failureStatus(String error, bool showDialog) {
    emit(HomeFailureState(error));
    if (showDialog) {
      EasyLoading.showError(error, duration: const Duration(seconds: 5));
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
