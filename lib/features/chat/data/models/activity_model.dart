import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

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

  factory ActivityModel.fromAPI(Map<String, dynamic> map) {
    return ActivityModel(
      id: map['activity_id'] as int,
      groupId: map['activity_group_id'] as int,
      createdBy: MemberModel(
        user: AuthUserEntity(
          id: map['user_id'] as int,
          image: map['user_image'] as String?,
          name:'${map['user_first_name'] as String} ${map['user_last_name'] as String}',
          email: map['user_email'] as String,
          password: '',
          userType: UserType.fromString(map['user_type'] as String?),
        ),
        groupId: map['group_id'] as int,
        canInteract: map['member_can_interaction'] as int == 1,
        notification: NotificationEnum.fromString(map['member_notification'] as String),
        joinDate: DateTime.parse(map['member_join_date'] as String),
        isAdmin: map['member_is_admin'] as int == 1,
      ),
      insideDirectoryId: map['activity_direction_id'] as int?,
      repliedOn: map['activity_reply_on'] as int?,
      content: map['activity_content'] as String? ?? '',
      attachment: map['activity_attachments_size'] == null
        ? null
        : AttachmentModel(
            size: map['activity_attachments_size'] as double,
            name: map['activity_content'] as String,
            uri: map['activity_attachments_url'] as String,
            mimeType: map['activity_attachments_mimetype'] as String?,
            width: map['activity_attachments_width'] as double?,
            height: map['activity_attachments_height'] as double?,
          ),
      createdAt: DateTime.parse(map['activity_date'] as String),
      isApproved: map['activity_is_approved'] as int == 1,
      notifyOthers: NotificationEnum.fromString(map['activity_notify_others'] as String),
      type: MessageType.fromString(map['activity_type'] as String),
    );
  }
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
