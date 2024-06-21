import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/separate_name.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../domain/entities/activity_entity.dart';
import '../../domain/entities/member_entity.dart';
import 'attachment_model.dart';

class ActivityModel extends ActivityEntity {
  final DateTime? activityLastModified;

  const ActivityModel({
    required super.id,
    required super.groupId,
    super.insideDirectoryId,
    required super.type,
    super.repliedOn,
    required super.content,
    required super.attachment,
    required super.createdAt,
    required super.isApproved,
    super.notifyOthers,
    this.activityLastModified,
    required super.createdBy,
  });

  factory ActivityModel.fromMap(Map<String, dynamic> data) {
    final String tempContent = data['activity_content'] as String? ?? '';
    final AttachmentModel? tempAttachment;
    if (data['activity_attachments_url'] != null) {
      tempAttachment = AttachmentModel(
        size: data['activity_attachments_size'] as num,
        name: tempContent,
        uri: data['activity_attachments_url'] as String,
        height: data['activity_attachments_height'] as num?,
        width: data['activity_attachments_width'] as num?,
        mimeType: data['activity_attachments_mimetype'] as String?,
      );
    } else {
      tempAttachment = null;
    }
    final AuthUserEntity tempUser = AuthUserEntity(
      id: data['user_id'] as int,
      name:
          "${data['user_first_name'] as String} ${data['user_last_name'] as String}",
      email: data['user_email'] as String,
      password: '',
      userType: UserType.fromString(data['user_type'] as String?),
      image: data['user_image'] as String?,
    );
    final MemberEntity tempCreatedBy = MemberEntity(
      user: tempUser,
      groupId: data['group_id'] as int,
      canInteract: data['member_can_interaction'] as int == 1,
      notification:
          NotificationEnum.fromString(data['member_notification'] as String),
      joinDate: DateTime.parse(data['member_join_date'] as String),
      isAdmin: data['member_is_admin'] as int == 1,
    );
    return ActivityModel(
      id: data['activity_id'] as int,
      groupId: data['activity_group_id'] as int,
      insideDirectoryId: data['activity_direction_id'] as int?,
      type: MessageType.fromString(data['activity_type'] as String),
      repliedOn: data['activity_reply_on'] as int?,
      content: tempContent,
      attachment: tempAttachment,
      createdAt: DateTime.parse(data['activity_date'] as String),
      isApproved: data['activity_is_approved'] as int == 1,
      notifyOthers:
          NotificationEnum.fromString(data['activity_notify_others'] as String),
      activityLastModified: data['activity_last_modified'] == null
          ? null
          : DateTime.parse(data['activity_last_modified'] as String),
      createdBy: tempCreatedBy,
    );
  }

  Map<String, dynamic> toMap() {
    final ({String fName, String lName}) name =
        separateName(createdBy.user.name);
    return {
      'activity_id': id,
      'activity_group_id': groupId,
      'activity_direction_id': insideDirectoryId,
      'activity_type': type.inString,
      'activity_reply_on': repliedOn,
      'activity_content': content,
      'activity_attachments_url': attachment?.uri,
      'activity_attachments_size': attachment?.size,
      'activity_attachments_height': attachment?.height,
      'activity_attachments_width': attachment?.width,
      'activity_attachments_mimetype': attachment?.mimeType,
      'activity_date': createdAt.toIso8601String(),
      'activity_is_approved': isApproved ? 1 : 0,
      'activity_notify_others': notifyOthers.inString,
      'activity_owner_id': createdBy.user.id,
      'activity_last_modified': activityLastModified?.toIso8601String(),
      'user_id': createdBy.user.id,
      'user_email': createdBy.user.email,
      'user_first_name': name.fName,
      'user_last_name': name.lName,
      'user_image': createdBy.user.image,
      'user_type': createdBy.user.userType.inString,
      'group_id': groupId,
      'member_id': createdBy.user.id,
      'member_can_interaction': createdBy.canInteract ? 1 : 0,
      'member_notification': createdBy.notification.inString,
      'member_join_date': createdBy.joinDate.toIso8601String(),
      'member_is_admin': createdBy.isAdmin ? 1 : 0,
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
  List<Object?> get props {
    return [
      id,
      groupId,
      insideDirectoryId,
      type,
      repliedOn,
      content,
      attachment,
      createdAt,
      isApproved,
      notifyOthers,
      activityLastModified,
      createdBy,
    ];
  }
}
