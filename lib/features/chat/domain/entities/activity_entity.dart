import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

import '../../data/models/activity_model.dart';
import '../../data/models/attachment_model.dart';
import 'member_entity.dart';

part 'activity_entity.g.dart';

@HiveType(typeId: 8)
class ActivityEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int groupId;
  @HiveField(2)
  final MemberEntity createdBy;
  @HiveField(3)
  final int? insideDirectoryId;
  @HiveField(4)
  final int? repliedOn;
  @HiveField(5)
  final String content;
  @HiveField(6)
  final AttachmentModel? attachment;
  @HiveField(7)
  final DateTime createdAt;
  @HiveField(8)
  final bool isApproved;
  @HiveField(9)
  final NotificationEnum notifyOthers;
  @HiveField(10)
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

  types.Message toMessage([String? directory]) {
    final Map<String, String?> map = {
      "activity": ActivityModel.fromEntity(this).toJson(),
    };
    if (directory != null) map["directory"] = directory;

    final String uid = const Uuid().v4();
    switch (type) {
      case MessageType.textMessage:
        return types.TextMessage(
          text: content,
          author: createdBy.messageAuthor(),
          id: uid,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
        );
      case MessageType.photo:
        return types.ImageMessage(
          author: createdBy.messageAuthor(),
          id: uid,
          name: content,
          size: attachment!.size,
          uri: attachment!.uri,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          metadata: map,
          height: attachment!.height,
          width: attachment!.width,
        );
      default:
        return types.FileMessage(
          author: createdBy.messageAuthor(),
          id: uid,
          name: content,
          size: attachment!.size,
          uri: attachment!.uri,
          createdAt: createdAt.millisecondsSinceEpoch,
          remoteId: id.toString(),
          mimeType: attachment!.mimeType,
          metadata: map,
        );
    }
  }

  static ActivityEntity? fromMessage(types.Message message) {
    final String? json = message.metadata?["activity"] as String?;
    if (json == null) return null;

    return ActivityModel.fromJson(json).copyWith(
      createdBy: MemberEntity.fromAuthor(message.author),
    );
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
