import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_status_enum.dart';
import 'package:hive/hive.dart';

import '../../../chat/data/models/member_model.dart';
import '../../../chat/domain/entities/activity_entity.dart';
import '../../../chat/domain/entities/member_entity.dart';
import 'group_home_entity.dart';

part 'group_notification_entity.g.dart';

@HiveType(typeId: 12)
final class GroupNotificationEntity extends GroupHomeEntity {
  final bool isExpanded;

  @HiveField(13)
  final int notificationId;

  const GroupNotificationEntity({
    this.isExpanded = false,
    required super.groupId,
    required this.notificationId,
    super.imageLink,
    required super.groupName,
    super.lastActivity,
    super.unReadCounter,
    required super.ownerId,
    super.bottomHeight,
    required super.discussion,
    super.accessType,
    required super.memberEntity,
    required super.createdAt,
    required super.screen,
    required super.status,
    required super.statusMessage,
  }) : super(isSelected: false);

  @override
  GroupNotificationEntity copyWith({
    int? groupId,
    int? notificationId,
    String? imageLink,
    String? groupName,
    ActivityEntity? lastActivity,
    int? unReadCounter,
    bool? isSelected,
    bool? isExpanded,
    int? ownerId,
    double? bottomHeight,
    GroupDiscussionType? discussion,
    GroupAccessType? accessType,
    MemberModel? member,
    DateTime? createdAt,
    int? screen,
    GroupStatus? status,
    String? statusMessage,
  }) {
    return GroupNotificationEntity(
      groupId: groupId ?? this.groupId,
      notificationId: notificationId ?? this.notificationId,
      lastActivity: lastActivity ?? this.lastActivity,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      isExpanded: isExpanded ?? this.isExpanded,
      imageLink: imageLink ?? this.imageLink,
      groupName: groupName ?? this.groupName,
      ownerId: ownerId ?? this.ownerId,
      bottomHeight: bottomHeight ?? this.bottomHeight,
      discussion: discussion ?? this.discussion,
      accessType: accessType ?? this.accessType,
      memberEntity: member ?? memberEntity,
      createdAt: createdAt ?? this.createdAt,
      screen: screen ?? this.screen,
      status: status ?? this.status,
      statusMessage: statusMessage ?? this.statusMessage,
    );
  }

  @override
  List<Object?> get props => [
        ...super.props,
        isExpanded,
        notificationId,
        groupId,
        lastActivity,
        createdAt,
      ];
}
