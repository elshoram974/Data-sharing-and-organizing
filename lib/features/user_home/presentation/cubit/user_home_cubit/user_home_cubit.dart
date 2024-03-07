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
    scrollController = ScrollController();
    scrollController.addListener(_onScroll);
  }
  final GetGroupsUseCase getGroupsUseCase;

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

  // * GetGroups
  Future<void> getGroups([inFirst = true, int page = 1]) async {
    if (inFirst) {
      emit(const GetGroupsInFirstLoadingState());
    } else {
      emit(const GetGroupsInLastLoadingState());
    }
    // await Future.delayed(Duration(seconds: 3));
    final Status<List<GroupHomeEntity>> status =
        await getGroupsUseCase((page: page, user: userMain.user));
    if (inFirst) {
      _makeAllSelectedOrNot(false);
      _currentPage = 1;
      currentGroups.clear();
    }
    if (status is Success<List<GroupHomeEntity>>) {
      currentGroups.addAll(status.data);
      emit(HomeSuccessState(status.data));
      debugPrint('groups: ${status.data}');
    } else if (status is Failure<List<GroupHomeEntity>>) {
      currentGroups.addAll(status.data!);
      debugPrint('groups: ${status.data}');
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
  int _currentPage = 1;
  void _onScroll() {
    if (scrollController.position.pixels >= .75 * scrollController.position.maxScrollExtent) {
      if (state is! GetGroupsInLastLoadingState) {
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
