import 'package:flutter/material.dart';

final class GroupNotificationEntity {
  final String? imageLink;
  final String groupName;
  final InlineSpan? lastMessage;
  final bool isUnread;
  final DateTime lastMessageTime;
  bool isExpanded;

  GroupNotificationEntity({
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.isUnread = false,
    required this.lastMessageTime,
    this.isExpanded = false,
  });
}
