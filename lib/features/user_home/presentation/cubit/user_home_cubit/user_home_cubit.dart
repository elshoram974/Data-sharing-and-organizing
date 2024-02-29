import 'package:data_sharing_organizing/core/utils/enums/home_selected_pop_up_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/group_home_entity.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeInitial(groupsItems)) {
    currentGroups.addAll(groupsItems);
  }
  final List<GroupHomeEntity> currentGroups = [];
  final List<GroupHomeEntity> selectedGroups = [];

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

final List<GroupHomeEntity> groupsItems = [
  GroupHomeEntity(
    id: 1,
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'aFirst year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    unReadCounter: null,
    isUnread: false,
    lastMessageTime: DateTime.now(),
  ),
  GroupHomeEntity(
    id: 2,
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'First year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    unReadCounter: null,
    isUnread: false,
    lastMessageTime: DateTime.now(),
  ),
  GroupHomeEntity(
    id: 3,
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'Second year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    unReadCounter: null,
    isUnread: false,
    lastMessageTime: DateTime.now(),
  ),
  GroupHomeEntity(
    id: 4,
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'Third year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    unReadCounter: null,
    isUnread: false,
    lastMessageTime: DateTime.now(),
  ),
];
