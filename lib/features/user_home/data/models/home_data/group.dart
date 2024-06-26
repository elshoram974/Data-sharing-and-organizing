import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_category_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_visibility_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/notification/notification_services.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../chat/data/models/activity_model.dart';
import '../../../../chat/data/models/member_model.dart';
import '../../../../chat/domain/entities/activity_entity.dart';
import '../../../domain/entities/group_home_entity.dart';

class GroupDetails extends GroupHomeEntity {
  final int groupIdDetails;
  final int groupOwnerId;
  final String? groupDescription;
  final GroupVisibility groupVisibility;
  final GroupCategory groupCategory;
  final String? groupImage;
  final GroupType groupType;
  final GroupStatus groupStatus;
  final String? groupStatusMessage;
  final ActivityModel? lastActivityModel;
  final MemberModel memberModel;

  const GroupDetails({
    required this.groupIdDetails,
    required super.groupName,
    required this.groupOwnerId,
    required super.createdAt,
    required this.groupDescription,
    required this.groupVisibility,
    required super.accessType,
    required this.groupCategory,
    required this.groupImage,
    required this.groupType,
    required super.discussion,
    required this.groupStatus,
    required this.groupStatusMessage,
    super.isSelected,
    this.lastActivityModel,
    super.unReadCounter,
    super.bottomHeight,
    required this.memberModel,
    super.screen = 0,
  }) : super(
          groupId: groupIdDetails,
          ownerId: groupOwnerId,
          imageLink: groupImage,
          lastActivity: lastActivityModel,
          memberEntity: memberModel,
          status: groupStatus,
          statusMessage: groupStatusMessage,
        );

  @override
  String toString() {
    return 'Group(groupId: $groupIdDetails, groupName: $groupName, groupOwnerId: $groupOwnerId, groupCreationDate: $createdAt, groupDescription: $groupDescription, groupVisibility: $groupVisibility, groupAccessType: $accessType, groupCategory: $groupCategory, groupImage: $groupImage, groupType: $groupType, groupDiscussionType: $discussion, groupStatus: $groupStatus, groupStatusMessage: $groupStatusMessage, isSelected: $isSelected, unReadCounter: $unReadCounter, lastActivity: $lastActivity , member: $memberEntity)';
  }

  factory GroupDetails.fromMap(Map<String, dynamic> data, AuthUserEntity user) {
    final int groupId = data['group_id'] as int;

    final NotificationEnum notify =
        NotificationEnum.fromString(data['member_notification'] as String);
    if (!AppConst.isWeb) {
      switch (notify) {
        case NotificationEnum.notify:
          NotificationApi.firebase.subscribeToTopic('$groupId');
          break;
        default:
          NotificationApi.firebase.unsubscribeFromTopic('$groupId');
      }
    }

    return GroupDetails(
      groupIdDetails: groupId,
      groupName: data['group_name'] as String,
      groupOwnerId: data['group_owner_id'] as int,
      createdAt: DateTime.parse(data['group_creation_date'] as String),
      groupDescription: data['group_description'] as String?,
      groupVisibility:
          GroupVisibility.fromString(data['group_visibility'] as String?),
      accessType:
          GroupAccessType.fromString(data['group_access_type'] as String?),
      groupCategory:
          GroupCategory.fromString(data['group_category'] as String?),
      groupImage: data['group_image'] as String?,
      groupType: GroupType.fromString(data['group_type'] as String?),
      discussion: GroupDiscussionType.fromString(
          data['group_discussion_type'] as String?),
      groupStatus: GroupStatus.fromString(data['group_status'] as String?),
      groupStatusMessage: data['group_status_message'] as String?,
      lastActivityModel: data['last_activity'] == null
          ? null
          : ActivityModel.fromMap(
              data['last_activity'] as Map<String, dynamic>),
      memberModel: MemberModel(
        user: user,
        groupId: groupId,
        canInteract: data['member_can_interaction'] as int == 1,
        notification: notify,
        joinDate: DateTime.parse(data['member_join_date'] as String),
        isAdmin: data['member_is_admin'] as int == 1,
      ),
    );
  }

  factory GroupDetails.fromMapNewGroup(
    Map<String, dynamic> data,
    AuthUserEntity user,
  ) {
    final int groupId = data['group_id'] as int;

    if (!AppConst.isWeb) NotificationApi.firebase.subscribeToTopic('$groupId');

    return GroupDetails(
      groupIdDetails: groupId,
      groupName: data['group_name'] as String,
      groupOwnerId: data['group_owner_id'] as int,
      createdAt: DateTime.parse(data['group_creation_date'] as String),
      groupDescription: data['group_description'] as String?,
      groupVisibility:
          GroupVisibility.fromString(data['group_visibility'] as String?),
      accessType:
          GroupAccessType.fromString(data['group_access_type'] as String?),
      groupCategory:
          GroupCategory.fromString(data['group_category'] as String?),
      groupImage: data['group_image'] as String?,
      groupType: GroupType.fromString(data['group_type'] as String?),
      discussion: GroupDiscussionType.fromString(
          data['group_discussion_type'] as String?),
      groupStatus: GroupStatus.fromString(data['group_status'] as String?),
      groupStatusMessage: data['group_status_message'] as String?,
      lastActivityModel: data['last_activity'] == null
          ? null
          : ActivityModel.fromMap(
              data['last_activity'] as Map<String, dynamic>),
      memberModel: MemberModel(
        user: user,
        groupId: groupId,
        canInteract: true,
        notification: NotificationEnum.notify,
        joinDate: DateTime.now(),
        isAdmin: true,
      ),
    );
  }

  Map<String, dynamic> toMap() => {
        'group_id': groupIdDetails,
        'group_name': groupName,
        'group_owner_id': groupOwnerId,
        'group_creation_date': createdAt.toIso8601String(),
        'group_description': groupDescription,
        'group_visibility': groupVisibility.inString,
        'group_access_type': accessType.inString,
        'group_category': groupCategory.inString,
        'group_image': groupImage,
        'group_type': groupType.inString,
        'group_discussion_type': discussion.inString,
        'group_status': groupStatus.inString,
        'group_status_message': groupStatusMessage,
        'last_activity': lastActivityModel?.toMap(),
        'member_id': memberModel.user.id,
        'member_can_interaction': memberModel.canInteract,
        'member_notification': memberModel.notification.inString,
        'member_join_date': memberModel.joinDate.toIso8601String(),
        'member_is_admin': memberModel.isAdmin ? 1 : 0,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GroupDetails].
  factory GroupDetails.fromJson(String data, AuthUserEntity user) {
    return GroupDetails.fromMap(
        json.decode(data) as Map<String, dynamic>, user);
  }

  /// `dart:convert`
  ///
  /// Converts [GroupDetails] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  GroupDetails copyWith({
    int? groupId,
    String? groupName,
    int? groupOwnerId,
    DateTime? createdAt,
    String? groupDescription,
    GroupVisibility? groupVisibility,
    GroupAccessType? accessType,
    GroupCategory? groupCategory,
    String? groupImage,
    GroupType? groupType,
    GroupDiscussionType? discussion,
    GroupStatus? groupStatus,
    String? groupStatusMessage,
    int? id,
    String? imageLink,
    ActivityEntity? lastActivity,
    int? unReadCounter,
    DateTime? lastMessageTime,
    bool? isSelected,
    bool? isMute,
    MessageType? lastMessageType,
    String? lastMessageFrom,
    int? ownerId,
    double? bottomHeight,
    MemberModel? member,
    int? screen,
    GroupStatus? status,
    String? statusMessage,
  }) {
    return GroupDetails(
      groupIdDetails: groupId ?? groupIdDetails,
      groupName: groupName ?? this.groupName,
      groupOwnerId: groupOwnerId ?? this.groupOwnerId,
      createdAt: createdAt ?? this.createdAt,
      groupDescription: groupDescription ?? this.groupDescription,
      groupVisibility: groupVisibility ?? this.groupVisibility,
      accessType: accessType ?? this.accessType,
      groupCategory: groupCategory ?? this.groupCategory,
      groupImage: groupImage ?? this.groupImage,
      groupType: groupType ?? this.groupType,
      discussion: discussion ?? this.discussion,
      groupStatus: groupStatus ?? this.groupStatus,
      groupStatusMessage: groupStatusMessage ?? this.groupStatusMessage,
      isSelected: isSelected ?? this.isSelected,
      lastActivityModel: lastActivity != null
          ? ActivityModel.fromEntity(lastActivity)
          : lastActivityModel,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      bottomHeight: bottomHeight ?? this.bottomHeight,
      memberModel: member ?? memberModel,
      screen: screen ?? this.screen,
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
