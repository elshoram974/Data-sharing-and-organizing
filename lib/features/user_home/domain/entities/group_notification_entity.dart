import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class GroupNotificationEntity extends Equatable {
  final String? imageLink;
  final String groupName;
  final InlineSpan? lastMessage;
  final bool isUnread;
  final DateTime lastMessageTime;
  final bool isExpanded;

  const GroupNotificationEntity({
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.isUnread = false,
    required this.lastMessageTime,
    this.isExpanded = false,
  });

  GroupNotificationEntity copyWith({
    String? imageLink,
    String? groupName,
    InlineSpan? lastMessage,
    bool? isUnread,
    DateTime? lastMessageTime,
    bool? isExpanded,
  }) {
    return GroupNotificationEntity(
      lastMessage: lastMessage ?? this.lastMessage,
      isExpanded: isExpanded ?? this.isExpanded,
      isUnread: isUnread ?? this.isUnread,
      imageLink: imageLink ?? this.imageLink,
      groupName: groupName ?? this.groupName,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
    );
  }

  @override
  List<Object?> get props => [
        imageLink,
        groupName,
        lastMessage,
        isUnread,
        lastMessageTime,
        isExpanded,
      ];
}
