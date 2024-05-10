import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/sort_groups_by_last_activity_time.dart';
import 'package:data_sharing_organizing/features/chat/domain/entities/activity_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../chat/domain/entities/member_entity.dart';
import '../../../domain/entities/group_notification_entity.dart';

part 'user_notification_state.dart';

class UserNotificationCubit extends Cubit<UserNotificationState> {
  UserNotificationCubit() : super(const UserNotificationInitial()) {
    list.sort(compareLastActivity);
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
      memberEntity:
          MemberEntity.newEmpty().copyWith(joinDate: DateTime(2001, 2, 3)),
      id: 0,
      createdAt: DateTime(2001, 2, 3),
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: 'First year in THIET aa aa a a a a a a a a a a a a',
      unReadCounter: 0,
      ownerId: 42,
      discussion: GroupDiscussionType.exist),
  GroupNotificationEntity(
    memberEntity: MemberEntity.newEmpty(),
    id: 1,
    createdAt: DateTime.now(),
    lastActivity: ActivityEntity(
      id: 1,
      groupId: 1,
      createdBy: MemberEntity.newEmpty(),
      content:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      createdAt: DateTime.now(),
      isApproved: true,
      type: MessageType.photo,
    ),
    imageLink: '',
    groupName: 'First year in THIET',
    ownerId: 42,
    discussion: GroupDiscussionType.existButClosed,
  ),
  GroupNotificationEntity(
    memberEntity: MemberEntity.newEmpty(),
    id: 2,
    createdAt: DateTime.now(),
    lastActivity: ActivityEntity(
      id: 2,
      groupId: 2,
      createdBy: MemberEntity.newEmpty(),
      content:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      createdAt: DateTime.now(),
      isApproved: true,
      type: MessageType.voiceMessage,
    ),
    imageLink: '',
    groupName: 'First year in THIET',
    unReadCounter: 1,
    ownerId: 42,
    discussion: GroupDiscussionType.notExist,
  ),
];
