import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

final class GroupHomeEntity extends Equatable {
  final int id;
  final String? imageLink;
  final String groupName;
  final InlineSpan? lastMessage;
  final int? unReadCounter;
  final bool isUnread;
  final DateTime lastMessageTime;
  final bool isMute;
  final bool isSelected;

  const GroupHomeEntity({
    required this.id,
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.unReadCounter,
    this.isUnread = false,
    required this.lastMessageTime,
    this.isSelected = false,
    this.isMute = false,
  });

  GroupHomeEntity copyWith({
    int? id,
    String? imageLink,
    String? groupName,
    InlineSpan? lastMessage,
    int? unReadCounter,
    bool? isUnread,
    DateTime? lastMessageTime,
    bool? isSelected,
    bool? isMute,
  }) {
    return GroupHomeEntity(
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      isSelected: isSelected ?? this.isSelected,
      isMute: isMute ?? this.isMute,
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
        unReadCounter,
        isUnread,
        isSelected,
        isMute
      ];
}
