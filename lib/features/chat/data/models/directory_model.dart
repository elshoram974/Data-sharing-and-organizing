import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../domain/entities/directory_entity.dart';
import '../../domain/entities/member_entity.dart';

class DirectoryModel extends DirectoryEntity {
  final int? directoryMaxCountActivity;

  const DirectoryModel({
    this.directoryMaxCountActivity,
    required super.id,
    required super.name,
    required super.insideDirectoryId,
    required super.groupId,
    required super.createdBy,
    required super.isApproved,
  });

  factory DirectoryModel.fromMap(Map<String, dynamic> data) {
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
    return DirectoryModel(
      id: data['direction_id'] as int,
      groupId: data['group_id'] as int,
      name: data['direction_address'] as String,
      directoryMaxCountActivity: data['direction_max_count_activity'] as int?,
      insideDirectoryId: data['inside_direction_id'] as int?,
      isApproved: data['direction_is_approved'] as int == 1,
      createdBy: tempCreatedBy,
    );
  }

  Map<String, dynamic> toMap() {
    final AuthUserEntity user = createdBy.user;
    final List<String> nameParts = user.name.split(" ");

    return {
      'direction_id': id,
      'group_id': groupId,
      'direction_address': name,
      'direction_max_count_activity': directoryMaxCountActivity,
      'inside_direction_id': insideDirectoryId,
      'direction_is_approved': isApproved ? 1 : 0,
      'direction_owner_id': user.id,
      'user_id': user.id,
      'user_email': user.email,
      'user_first_name': nameParts.first.trim(),
      'user_last_name': nameParts.sublist(1).join(" ").trim(),
      'user_image': user.image,
      'user_type': user.userType.inString,
      'member_id': user.id,
      'member_can_interaction': createdBy.canInteract ? 1 : 0,
      'member_notification': createdBy.notification.inString,
      'member_join_date': createdBy.joinDate.toIso8601String(),
      'member_is_admin': createdBy.isAdmin ? 1 : 0,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DirectoryModel].
  factory DirectoryModel.fromJson(String data) {
    return DirectoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DirectoryModel] to a JSON string.
  String toJson() => json.encode(toMap());

  factory DirectoryModel.fromEntity(DirectoryEntity entity) {
    return DirectoryModel(
      id: entity.id,
      name: entity.name,
      insideDirectoryId: entity.insideDirectoryId,
      groupId: entity.groupId,
      createdBy: entity.createdBy,
      isApproved: entity.isApproved,
    );
  }

  @override
  List<Object?> get props {
    return [directoryMaxCountActivity, ...super.props];
  }
}
