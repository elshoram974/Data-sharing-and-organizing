import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'group_home_entity.g.dart';

@HiveType(typeId: 4)
class GroupHomeEntity extends Equatable {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String? imageLink;

  @HiveField(2)
  final String groupName;

  @HiveField(3)
  final bool isMute;

  @HiveField(4)
  final int? unReadCounter;

  @HiveField(5)
  final bool isUnread;

  @HiveField(6)
  final DateTime? lastMessageTime;

  @HiveField(7)
  final String? lastMessage;

  @HiveField(8)
  final String? lastMessageFrom;

  @HiveField(9)
  final MessageType? lastMessageType;

  @HiveField(10)
  final int ownerId;

  final bool isSelected;

  const GroupHomeEntity({
    required this.id,
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.lastMessageType,
    this.lastMessageFrom,
    this.unReadCounter,
    this.isUnread = false,
    this.lastMessageTime,
    this.isSelected = false,
    this.isMute = false,
    required this.ownerId,
  });

  GroupHomeEntity copyWith({
    int? id,
    String? imageLink,
    String? groupName,
    String? lastMessage,
    int? unReadCounter,
    bool? isUnread,
    DateTime? lastMessageTime,
    bool? isSelected,
    bool? isMute,
    MessageType? lastMessageType,
    String? lastMessageFrom,
    int? ownerId,
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
      lastMessageType: lastMessageType ?? this.lastMessageType,
      lastMessageFrom: lastMessageFrom ?? this.lastMessageFrom,
      ownerId: ownerId ?? this.ownerId,
    );
  }

  @override
  List<Object?> get props => [id, ownerId];
}
