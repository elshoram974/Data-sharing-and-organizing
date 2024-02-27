import 'package:flutter/material.dart';

final class GroupHomeEntity {
  final String? imageLink;
  final String groupName;
  final TextSpan? lastMessage;
  final int? unReadCounter;
  final bool isUnread;
  final DateTime lastMessageTime;
  bool isSelected;

  GroupHomeEntity({
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.unReadCounter,
    this.isUnread = false,
    required this.lastMessageTime,
    this.isSelected = false,
  });
}
