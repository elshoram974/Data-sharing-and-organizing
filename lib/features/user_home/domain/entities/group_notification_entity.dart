import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';

import '../../../chat/data/models/member_model.dart';
import '../../../chat/domain/entities/activity_entity.dart';
import 'group_home_entity.dart';

final class GroupNotificationEntity extends GroupHomeEntity {
  final bool isExpanded;

  const GroupNotificationEntity({
    this.isExpanded = false,
    required super.id,
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
  }) : super(isSelected: false, isMute: false);

  @override
  GroupNotificationEntity copyWith({
    int? id,
    String? imageLink,
    String? groupName,
    ActivityEntity? lastActivity,
    int? unReadCounter,
    bool? isSelected,
    bool? isUnread,
    bool? isMute,
    bool? isExpanded,
    int? ownerId,
    double? bottomHeight,
    GroupDiscussionType? discussion,
    GroupAccessType? accessType,
    MemberModel? member,
    DateTime? createdAt,
  }) {
    return GroupNotificationEntity(
      id: id ?? this.id,
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
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
