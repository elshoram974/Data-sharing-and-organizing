import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
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

    final int index = currentNotifications.indexOf(replaced);
    currentNotifications[index] = replaced;

    emit(ExpandNotificationState(replaced));
  }
}

final list = [
  GroupNotificationEntity(
    id: 0,
    lastMessageType: MessageType.location,
    imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
    groupName: 'First year in THIET aa aa a a a a a a a a a a a a',
    lastMessage:
        'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
    isUnread: true,
    lastMessageTime: DateTime.now(),
    ownerId: 42
  ),
  GroupNotificationEntity(
    id: 1,
    lastMessageType: MessageType.photo,
    imageLink: '',
    groupName: 'First year in THIET',
    lastMessage:
        'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
    lastMessageTime: DateTime.now(),
    ownerId: 42
  ),
  GroupNotificationEntity(
    id: 2,
    lastMessageType: MessageType.voiceMessage,
    imageLink: '',
    groupName: 'First year in THIET',
    lastMessage:
        'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
    lastMessageTime: DateTime.now(),
    ownerId: 42
  ),
];
