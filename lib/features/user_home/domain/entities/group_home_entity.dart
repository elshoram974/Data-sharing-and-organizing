import 'package:data_sharing_organizing/core/utils/enums/home/group_access_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../chat/data/models/member_model.dart';
import '../../../chat/domain/entities/activity_entity.dart';
import '../../../chat/domain/entities/member_entity.dart';

part 'group_home_entity.g.dart';

@HiveType(typeId: 4)
class GroupHomeEntity extends Equatable {
  @HiveField(0)
  final int groupId;

  @HiveField(1)
  final String? imageLink;

  @HiveField(2)
  final String groupName;

  @HiveField(4)
  final int? unReadCounter;

  @HiveField(5)
  final int ownerId;

  @HiveField(6)
  final double? bottomHeight;

  @HiveField(7)
  final GroupDiscussionType discussion;

  @HiveField(8)
  final MemberEntity memberEntity;

  @HiveField(9)
  final ActivityEntity? lastActivity;

  @HiveField(10)
  final DateTime createdAt;

  @HiveField(11)
  final GroupAccessType accessType;

  @HiveField(12)
  final int screen;

  final bool isSelected;

  const GroupHomeEntity({
    required this.groupId,
    this.imageLink,
    required this.groupName,
    this.unReadCounter,
    this.lastActivity,
    this.isSelected = false,
    required this.ownerId,
    this.bottomHeight,
    required this.discussion,
    this.accessType = GroupAccessType.onlyRead,
    required this.memberEntity,
    required this.createdAt,
    required this.screen,
  });

  factory GroupHomeEntity.newEmpty() {
    return GroupHomeEntity(
      groupId: -1,
      unReadCounter: null,
      isSelected: false,
      groupName: '',
      ownerId: -1,
      discussion: GroupDiscussionType.notExist,
      memberEntity: MemberEntity.newEmpty(),
      createdAt: DateTime.now(),
      screen: 0,
    );
  }
  GroupHomeEntity copyWith({
    int? groupId,
    String? imageLink,
    String? groupName,
    ActivityEntity? lastActivity,
    int? unReadCounter,
    bool? isSelected,
    int? ownerId,
    double? bottomHeight,
    GroupDiscussionType? discussion,
    GroupAccessType? accessType,
    MemberModel? member,
    DateTime? createdAt,
    int? screen,
  }) {
    return GroupHomeEntity(
      groupId: groupId ?? this.groupId,
      unReadCounter: unReadCounter ?? this.unReadCounter,
      isSelected: isSelected ?? this.isSelected,
      imageLink: imageLink ?? this.imageLink,
      groupName: groupName ?? this.groupName,
      lastActivity: lastActivity ?? this.lastActivity,
      ownerId: ownerId ?? this.ownerId,
      bottomHeight: bottomHeight ?? this.bottomHeight,
      discussion: discussion ?? this.discussion,
      accessType: accessType ?? this.accessType,
      memberEntity: member ?? memberEntity,
      createdAt: createdAt ?? this.createdAt,
      screen: screen ?? this.screen,
    );
  }

  GroupHomeEntity copyWithNull({
    required int id,
    required String? imageLink,
    required String groupName,
    required ActivityEntity? lastActivity,
    required int? unReadCounter,
    required bool isSelected,
    required int ownerId,
    required double? bottomHeight,
    required GroupDiscussionType discussion,
    required GroupAccessType accessType,
    required MemberModel member,
    required DateTime createdAt,
    required int screen,
  }) {
    return GroupHomeEntity(
      groupId: id,
      unReadCounter: unReadCounter,
      isSelected: isSelected,
      imageLink: imageLink,
      groupName: groupName,
      lastActivity: lastActivity,
      ownerId: ownerId,
      bottomHeight: bottomHeight,
      discussion: discussion,
      accessType: accessType,
      memberEntity: member,
      createdAt: createdAt,
      screen: screen,
    );
  }

  @override
  List<Object?> get props =>
      [groupId, ownerId, memberEntity, createdAt, screen];
}
