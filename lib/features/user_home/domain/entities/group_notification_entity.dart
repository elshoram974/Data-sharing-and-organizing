import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';

import '../../../chat/domain/entities/member_entity.dart';
import 'group_home_entity.dart';

final class GroupNotificationEntity extends GroupHomeEntity {
  final bool isExpanded;

  const GroupNotificationEntity({
    this.isExpanded = false,
    required super.id,
    super.imageLink,
    required super.groupName,
    required super.lastMessageType,
    required super.lastMessageTime,
    super.lastMessage,
    super.lastMessageFrom = 'You',
    super.unReadCounter,
    required super.ownerId,
    super.bottomHeight,
    required super.discussion,
    super.accessType,
    required super.memberEntity,
  }) : super(isSelected: false, isMute: false);

  @override
  GroupNotificationEntity copyWith({
    int? id,
    String? imageLink,
    String? groupName,
    String? lastMessage,
    MessageType? lastMessageType,
    String? lastMessageFrom,
    DateTime? lastMessageTime,
    int? unReadCounter,
    bool? isSelected,
    bool? isUnread,
    bool? isMute,
    bool? isExpanded,
    int? ownerId,
    double? bottomHeight,
    GroupDiscussionType? discussion,
    GroupAccessType? accessType,
    MemberEntity? memberEntity,
  }) {
    return GroupNotificationEntity(
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      lastMessageFrom: lastMessageFrom ?? this.lastMessageFrom,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      isExpanded: isExpanded ?? this.isExpanded,
      imageLink: imageLink ?? this.imageLink,
      groupName: groupName ?? this.groupName,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      ownerId: ownerId ?? this.ownerId,
      bottomHeight: bottomHeight ?? this.bottomHeight,
      discussion: discussion ?? this.discussion,
      accessType : accessType ?? this.accessType,
      memberEntity: memberEntity ?? this.memberEntity,
    );
  }

  @override
  List<Object?> get props => [id, ownerId , memberEntity];
}
