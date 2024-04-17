import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../data/models/attachment_model.dart';
import 'member_entity.dart';

class ActivityEntity extends Equatable {
  final int id;
  final int groupId;
  final MemberEntity createdBy;
  final int? insideDirectoryId;
  final int? repliedOn;
  final String content;
  final AttachmentModel? attachment;
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
    required this.content,
    this.attachment,
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
    AttachmentModel? attachment,
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
      attachment: attachment ?? this.attachment,
      content: content ?? this.content,
      insideDirectoryId: insideDirectoryId ?? this.insideDirectoryId,
      notifyOthers: notifyOthers ?? this.notifyOthers,
      repliedOn: repliedOn ?? this.repliedOn,
      type: type ?? this.type,
    );
  }

  ActivityEntity copyWithNull({
    required int? insideDirectoryId,
    required int? repliedOn,
    required AttachmentModel? attachment,
    required double? fileSize,
  }) {
    return ActivityEntity(
      id: id,
      groupId: groupId,
      createdBy: createdBy,
      createdAt: createdAt,
      isApproved: isApproved,
      attachment: attachment,
      content: content,
      insideDirectoryId: insideDirectoryId,
      notifyOthers: notifyOthers,
      repliedOn: repliedOn,
      type: type,
    );
  }

  types.Message toMessage() {
    final Map<String, ActivityEntity> map = {"activity": this};
    switch (type) {
      case MessageType.textMessage:
        return types.TextMessage(
          text: content,
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
          name: content,
          size: attachment!.size,
          uri: attachment!.uri,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
          height: attachment!.height,
          width: attachment!.width,
          type: types.MessageType.image,
        );
      default:
        return types.FileMessage(
          author: createdBy.messageAuthor(),
          id: id.toString(),
          name: content,
          size: attachment!.size,
          uri: attachment!.uri,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          mimeType: attachment!.mimeType,
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
        attachment,
        createdAt,
        isApproved,
        notifyOthers,
        type,
      ];
}
