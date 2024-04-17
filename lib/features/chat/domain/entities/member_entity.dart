import 'package:data_sharing_organizing/core/utils/enums/member_notification_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import '../../../../core/utils/enums/user_role/user_type_enum.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';

part 'member_entity.g.dart';

@HiveType(typeId: 7)
class MemberEntity extends Equatable {
  @HiveField(0)
  final AuthUserEntity user;
  @HiveField(1)
  final bool canInteract;
  @HiveField(2, defaultValue: MemberNotificationEnum.notify)
  final MemberNotificationEnum notification;
  @HiveField(3)
  final DateTime joinDate;
  @HiveField(4)
  final bool isAdmin;
  @HiveField(5)
  final int groupId;

  const MemberEntity({
    required this.user,
    required this.groupId,
    required this.canInteract,
    this.notification = MemberNotificationEnum.notify,
    required this.joinDate,
    required this.isAdmin,
  });
  @override
  List<Object?> get props => [
        user,
        groupId,
        canInteract,
        notification,
        joinDate,
        isAdmin,
      ];

  MemberEntity copyWith({
    AuthUserEntity? user,
    int? groupId,
    bool? canInteract,
    MemberNotificationEnum? notification,
    DateTime? joinDate,
    bool? isAdmin,
  }) {
    return MemberEntity(
      user: user ?? this.user,
      groupId: groupId ?? this.groupId,
      canInteract: canInteract ?? this.canInteract,
      notification: notification ?? this.notification,
      joinDate: joinDate ?? this.joinDate,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }

  factory MemberEntity.test() {
    return MemberEntity(
      user: const AuthUserEntity(
        id: -1,
        name: '',
        email: '',
        password: '',
        userType: UserType.personal,
      ),
      groupId: -1,
      canInteract: false,
      joinDate: DateTime.now(),
      isAdmin: false,
    );
  }
}
