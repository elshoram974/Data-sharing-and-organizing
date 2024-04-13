import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_category_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_visibility_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';

import '../../../domain/entities/group_home_entity.dart';

class GroupDetails extends GroupHomeEntity {
  final int groupId;
  final int groupOwnerId;
  final DateTime? groupCreationDate;
  final String? groupDescription;
  final GroupVisibility groupVisibility;
  final GroupAccessType groupAccessType;
  final GroupCategory groupCategory;
  final String? groupImage;
  final GroupType groupType;
  final GroupDiscussionType discussionType;
  final GroupStatus groupStatus;
  final String? groupStatusMessage;

  const GroupDetails({
    required this.groupId,
    required super.groupName,
    required this.groupOwnerId,
    required this.groupCreationDate,
    required this.groupDescription,
    required this.groupVisibility,
    required this.groupAccessType,
    required this.groupCategory,
    required this.groupImage,
    required this.groupType,
    required this.discussionType,
    required this.groupStatus,
    required this.groupStatusMessage,
    super.isMute,
    super.isSelected,
    super.lastMessage,
    super.lastMessageFrom,
    super.lastMessageTime,
    super.lastMessageType,
    super.unReadCounter,
    super.bottomHeight,
  }) : super(
          id: groupId,
          ownerId: groupOwnerId,
          imageLink: groupImage,
        );

  @override
  String toString() {
    return 'Group(groupId: $groupId, groupName: $groupName, groupOwnerId: $groupOwnerId, groupCreationDate: $groupCreationDate, groupDescription: $groupDescription, groupVisibility: $groupVisibility, groupAccessType: $groupAccessType, groupCategory: $groupCategory, groupImage: $groupImage, groupType: $groupType, groupDiscussionType: $discussionType, groupStatus: $groupStatus, groupStatusMessage: $groupStatusMessage, isSelected: $isSelected, isMuted: $isMute, unReadCounter: $unReadCounter, lastMessageTime: $lastMessageTime, lastMessageType: $lastMessageType, lastMessageFrom: $lastMessageFrom, lastMessage: $lastMessage)';
  }

  factory GroupDetails.fromMap(Map<String, dynamic> data) => GroupDetails(
        groupId: data['group_id'] as int,
        groupName: data['group_name'] as String,
        groupOwnerId: data['group_owner_id'] as int,
        groupCreationDate:
            DateTime.tryParse(data['group_creation_date'] as String),
        groupDescription: data['group_description'] as String?,
        groupVisibility:
            GroupVisibility.fromString(data['group_visibility'] as String?),
        groupAccessType:
            GroupAccessType.fromString(data['group_access_type'] as String?),
        groupCategory:
            GroupCategory.fromString(data['group_category'] as String?),
        groupImage: data['group_image'] as String?,
        groupType: GroupType.fromString(data['group_type'] as String?),
        discussionType: GroupDiscussionType.fromString(
            data['group_discussion_type'] as String?),
        groupStatus: GroupStatus.fromString(data['group_status'] as String?),
        groupStatusMessage: data['group_status_message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'group_id': groupId,
        'group_name': groupName,
        'group_owner_id': groupOwnerId,
        'group_creation_date': groupCreationDate?.toIso8601String(),
        'group_description': groupDescription,
        'group_visibility': groupVisibility.inString,
        'group_access_type': groupAccessType.inString,
        'group_category': groupCategory.inString,
        'group_image': groupImage,
        'group_type': groupType.inString,
        'group_discussion_type': discussionType.inString,
        'group_status': groupStatus.inString,
        'group_status_message': groupStatusMessage,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GroupDetails].
  factory GroupDetails.fromJson(String data) {
    return GroupDetails.fromMap(json.decode(data) as Map<String, dynamic>);
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
    DateTime? groupCreationDate,
    String? groupDescription,
    GroupVisibility? groupVisibility,
    GroupAccessType? groupAccessType,
    GroupCategory? groupCategory,
    String? groupImage,
    GroupType? groupType,
    GroupDiscussionType? discussionType,
    GroupStatus? groupStatus,
    String? groupStatusMessage,
    int? id,
    String? imageLink,
    String? lastMessage,
    int? unReadCounter,
    DateTime? lastMessageTime,
    bool? isSelected,
    bool? isMute,
    MessageType? lastMessageType,
    String? lastMessageFrom,
    int? ownerId,
    double? bottomHeight,
  }) {
    return GroupDetails(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      groupOwnerId: groupOwnerId ?? this.groupOwnerId,
      groupCreationDate: groupCreationDate ?? this.groupCreationDate,
      groupDescription: groupDescription ?? this.groupDescription,
      groupVisibility: groupVisibility ?? this.groupVisibility,
      groupAccessType: groupAccessType ?? this.groupAccessType,
      groupCategory: groupCategory ?? this.groupCategory,
      groupImage: groupImage ?? this.groupImage,
      groupType: groupType ?? this.groupType,
      discussionType: discussionType ?? this.discussionType,
      groupStatus: groupStatus ?? this.groupStatus,
      groupStatusMessage: groupStatusMessage ?? this.groupStatusMessage,
      isMute: isMute ?? this.isMute,
      isSelected: isSelected ?? this.isSelected,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageFrom: lastMessageFrom ?? this.lastMessageFrom,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      bottomHeight: bottomHeight ?? this.bottomHeight,
    );
  }

  @override
  List<Object?> get props => [id, ownerId];
}
