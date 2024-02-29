import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/group_notification_entity.dart';

part 'user_notification_state.dart';

class UserNotificationCubit extends Cubit<UserNotificationState> {
  UserNotificationCubit() : super(const UserNotificationInitial()) {
    currentNotifications.addAll(list);
  }
  final List<GroupNotificationEntity> currentNotifications = [];

  void onPressExpanded(GroupNotificationEntity notification) {
    final GroupNotificationEntity replaced =
        notification.copyWith(isExpanded: !notification.isExpanded);

    final int index = currentNotifications.indexOf(notification);
    currentNotifications[index] = replaced;

    emit(ExpandNotificationState(replaced));
  }
}

final list = [
  GroupNotificationEntity(
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'First year in THIET aa aa a a a a a a a a a a a a',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    isUnread: true,
    lastMessageTime: DateTime.now(),
  ),
  GroupNotificationEntity(
    imageLink: '',
    groupName: 'First year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    lastMessageTime: DateTime.now(),
  ),
  GroupNotificationEntity(
    imageLink: '',
    groupName: 'First year in THIET',
    lastMessage: const TextSpan(
        text:
            'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message '),
    lastMessageTime: DateTime.now(),
  ),
];
