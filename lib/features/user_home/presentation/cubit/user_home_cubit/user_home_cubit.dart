import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/group_home_entity.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeInitial(groupsItems)) {
    _groups.addAll(groupsItems);
    currentGroups.addAll(_groups);
  }
  final List<GroupHomeEntity> _groups = [];
  final List<GroupHomeEntity> currentGroups = [];
  final List<GroupHomeEntity> selectedGroups = [];

  void onTapGroup(GroupHomeEntity group) {
    if (isSelected) {
      onLongTapGroup(group);
    } else {
      // go to screen
    }
  }

  void onLongTapGroup(GroupHomeEntity group) {
    _selectGroup(group, !group.isSelected);
  }

  void _selectGroup(GroupHomeEntity group, bool makeSelected) {
    group = group.copyWith(isSelected: makeSelected);
    if (makeSelected) {
      selectedGroups.add(group);
    } else {
      selectedGroups.remove(group);
    }

    final int index = groupsItems.indexOf(group);

    currentGroups[index] = group;

    emit(UserHomeSelectGroup([group], makeSelected));
  }

  void _addOrRemoveFromSelectedGroups(
    List<GroupHomeEntity> groupsToSelect,
    bool makeSelected,
  ) {
    final GroupHomeHelper helper = GroupHomeHelper(currentGroups);
    if (makeSelected) {
      selectedGroups.addAll(groupsToSelect);
    } else {
      selectedGroups.removeWhere((e) => groupsToSelect.contains(e));
    }
    final List<GroupHomeEntity> temp = [];
    temp.addAll(helper.makeGroupsSelectedOrNot(groupsToSelect, makeSelected));

    currentGroups.clear();
    currentGroups.addAll(temp);

    emit(UserHomeSelectGroup(groupsToSelect, makeSelected));
  }

  bool get isSelected => selectedGroups.isNotEmpty;
}

final class GroupHomeHelper {
  const GroupHomeHelper(this.groups);

  final List<GroupHomeEntity> groups;

  List<GroupHomeEntity> getSelectedOrNotGroups(bool selected) {
    return groups.where((e) => e.isSelected == selected).toList();
  }

  List<GroupHomeEntity> makeGroupsSelectedOrNot(
    List<GroupHomeEntity> groupsToSelect,
    bool makeSelected,
  ) {
    final List<GroupHomeEntity> temp = [];

    for (final GroupHomeEntity e in groups) {
      if (groupsToSelect.contains(e)) {
        temp.add(e.copyWith(isSelected: makeSelected));
      } else {
        temp.add(e);
      }
    }
    return temp;
  }

  List<GroupHomeEntity> groupsWithOut(List<GroupHomeEntity> deletedGroups) {
    final List<GroupHomeEntity> temp = [];
    for (final GroupHomeEntity e in groups) {
      if (!deletedGroups.contains(e)) temp.add(e);
    }
    return temp;
  }
}

final List<GroupHomeEntity> groupsItems = [
  GroupHomeEntity(
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
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'First year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    unReadCounter: null,
    isUnread: false,
    lastMessageTime: DateTime.now(),
  ),
];
