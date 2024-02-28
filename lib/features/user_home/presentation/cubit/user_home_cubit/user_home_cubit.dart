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
    print(selectedGroups.length);
  }

  void onLongTapGroup(GroupHomeEntity group) =>
      _selectGroup(group, !group.isSelected);

  void _selectGroup(GroupHomeEntity group, bool makeSelected) {
    final replaced = group.copyWith(isSelected: makeSelected);
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
    selectedGroups.clear();
    if (makeSelected) selectedGroups.addAll(currentGroups);

    for (int i = 0; i < currentGroups.length; i++) {
      currentGroups[i] = currentGroups[i].copyWith(isSelected: makeSelected);
    }

    emit(UserHomeSelectGroups(currentGroups, makeSelected));
  }

  void onWillPop() {
    if (isSelected) _makeAllSelectedOrNot(false);
  }

  bool get isSelected => selectedGroups.isNotEmpty;
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
