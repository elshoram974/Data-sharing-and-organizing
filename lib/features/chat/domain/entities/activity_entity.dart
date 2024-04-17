import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import 'member_entity.dart';

class ActivityEntity extends Equatable {
  final int id;
  final int groupId;
  final MemberEntity createdBy;
  final int? insideDirectoryId;
  final int? repliedOn;
  final String? content;
  final String? attachmentLink;
  final double? fileSize;
  final DateTime createdAt;
  final bool isApproved;
  final NotificationEnum notifyOthers;
  final MessageType type;

  const ActivityEntity({
    required this.id,
    required this.groupId,
    required this.createdBy,
    this.insideDirectoryId,
    this.repliedOn,
    this.content,
    this.attachmentLink,
    this.fileSize,
    required this.createdAt,
    required this.isApproved,
    this.notifyOthers = NotificationEnum.notify,
    required this.type,
  });

  ActivityEntity copyWith({
    int? id,
    int? groupId,
    MemberEntity? createdBy,
    int? insideDirectoryId,
    int? repliedOn,
    String? content,
    String? attachmentLink,
    double? fileSize,
    DateTime? createdAt,
    bool? isApproved,
    NotificationEnum? notifyOthers,
    MessageType? type,
  }) {
    return ActivityEntity(
      id: id ?? this.id,
      groupId: groupId ?? this.groupId,
      createdBy: createdBy ?? this.createdBy,
      createdAt: createdAt ?? this.createdAt,
      isApproved: isApproved ?? this.isApproved,
      attachmentLink: attachmentLink ?? this.attachmentLink,
      fileSize: fileSize ?? this.fileSize,
      content: content ?? this.content,
      insideDirectoryId: insideDirectoryId ?? this.insideDirectoryId,
      notifyOthers: notifyOthers ?? this.notifyOthers,
      repliedOn: repliedOn ?? this.repliedOn,
      type: type ?? this.type,
    );
  }

  ActivityEntity makeNull({
    required int? insideDirectoryId,
    required int? repliedOn,
    required String? content,
    required String? attachmentLink,
    required double? fileSize,
  }) {
    return ActivityEntity(
      id: id,
      groupId: groupId,
      createdBy: createdBy,
      createdAt: createdAt,
      isApproved: isApproved,
      attachmentLink: attachmentLink,
      fileSize: fileSize,
      content: content,
      insideDirectoryId: insideDirectoryId,
      notifyOthers: notifyOthers,
      repliedOn: repliedOn,
      type: type,
    );
  }

  types.Message toMessage() {
    final map = {"activity": this};
    switch (type) {
      case MessageType.textMessage:
        return types.TextMessage(
          text: content!,
          author: createdBy.messageAuthor(),
          id: id.toString(),
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
          type: types.MessageType.text,
        );
      case MessageType.photo:
        return types.ImageMessage(
          author: createdBy.messageAuthor(),
          id: id.toString(),
          name: content ?? "image",
          size: fileSize!,
          uri: attachmentLink!,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
          height: 50,
          width: 50,
          type: types.MessageType.image,
        );
      default:
        return types.FileMessage(
          author: createdBy.messageAuthor(),
          id: id.toString(),
          name: content!,
          size: fileSize!,
          uri: attachmentLink!,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
          type: types.MessageType.file,
        );
    }
  }

  static ActivityEntity? fromMessage(types.Message message) {
    return message.metadata?["activity"] as ActivityEntity?;
  }

  @override
  List<Object?> get props => [
        id,
        insideDirectoryId,
        isApproved,
        createdBy,
        repliedOn,
        content,
        attachmentLink,
        createdAt,
        isApproved,
        notifyOthers,
        type,
      ];
}
