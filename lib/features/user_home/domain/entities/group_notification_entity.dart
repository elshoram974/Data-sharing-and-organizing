import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';

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
    super.isUnread = false,
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
  }) {
    return GroupNotificationEntity(
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      lastMessageFrom: lastMessageFrom ?? this.lastMessageFrom,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      isExpanded: isExpanded ?? this.isExpanded,
      isUnread: isUnread ?? this.isUnread,
      imageLink: imageLink ?? this.imageLink,
      groupName: groupName ?? this.groupName,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  @override
  List<Object?> get props => [
        id,
        imageLink,
        groupName,
        lastMessage,
        lastMessageType,
        lastMessageFrom,
        unReadCounter,
        isUnread,
        lastMessageTime,
        isExpanded,
      ];
}
