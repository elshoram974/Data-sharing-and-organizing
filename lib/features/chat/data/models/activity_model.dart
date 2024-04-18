import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';

import '../../data/models/attachment_model.dart';
import '../../domain/entities/activity_entity.dart';
import 'member_model.dart';

class ActivityModel extends ActivityEntity {
  const ActivityModel({
    required super.id,
    required super.groupId,
    required super.createdBy,
    required super.insideDirectoryId,
    required super.repliedOn,
    required super.content,
    required super.attachment,
    required super.createdAt,
    required super.isApproved,
    required super.notifyOthers,
    required super.type,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['id'] as int,
      groupId: map['groupId'] as int,
      createdBy: MemberModel.fromMap(map['createdBy'] as Map<String, dynamic>),
      insideDirectoryId: map['insideDirectoryId'] as int?,
      repliedOn: map['repliedOn'] as int?,
      content: map['content'] as String,
      attachment: map['attachment'] == null
          ? null
          : AttachmentModel.fromMap(map['attachment'] as Map<String, dynamic>),
      createdAt: DateTime.parse(map['createdAt'] as String),
      isApproved: map['isApproved'] as bool,
      notifyOthers: NotificationEnum.fromString(map['notifyOthers'] as String),
      type: MessageType.fromString(map['type'] as String),
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> createdByMap = MemberModel(
            user: createdBy.user,
            groupId: createdBy.groupId,
            canInteract: createdBy.canInteract,
            joinDate: createdBy.joinDate,
            isAdmin: createdBy.isAdmin,
            notification: createdBy.notification)
        .toMap();

    return {
      'id': id,
      'groupId': groupId,
      'createdBy': createdByMap,
      'insideDirectoryId': insideDirectoryId,
      'repliedOn': repliedOn,
      'content': content,
      'attachment': attachment?.toMap(),
      'createdAt': createdAt.toIso8601String(),
      'isApproved': isApproved,
      'notifyOthers': notifyOthers.inString,
      'type': type.inString,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ActivityModel].
  factory ActivityModel.fromJson(String data) {
    return ActivityModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ActivityModel] to a JSON string.
  String toJson() => json.encode(toMap());

  factory ActivityModel.fromEntity(ActivityEntity entity) {
    return ActivityModel(
      id: entity.id,
      groupId: entity.groupId,
      createdBy: entity.createdBy,
      insideDirectoryId: entity.insideDirectoryId,
      repliedOn: entity.repliedOn,
      content: entity.content,
      attachment: entity.attachment,
      createdAt: entity.createdAt,
      isApproved: entity.isApproved,
      notifyOthers: entity.notifyOthers,
      type: entity.type,
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
