import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/separate_name.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../../core/utils/enums/user_role/user_type_enum.dart';
import '../../../auth/data/models/app_user/user.dart';
import '../../../auth/domain/entities/auth_user_entity.dart';

part 'member_entity.g.dart';

@HiveType(typeId: 7)
class MemberEntity extends Equatable {
  @HiveField(0)
  final AuthUserEntity user;
  @HiveField(1)
  final bool canInteract;
  @HiveField(2, defaultValue: NotificationEnum.notify)
  final NotificationEnum notification;
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
    this.notification = NotificationEnum.notify,
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
    NotificationEnum? notification,
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

  factory MemberEntity.newEmpty() {
    return MemberEntity(
      user: const AuthUserEntity(
        id: -1,
        name: 'Test',
        email: '',
        password: '',
        userType: UserType.personal,
      ),
      groupId: -1,
      canInteract: true,
      joinDate: DateTime.now(),
      isAdmin: true,
    );
  }

  types.User messageAuthor() {
    final ({String fName, String lName}) separate = separateName(user.name);
    return types.User(
        id: user.id.toString(),
        firstName: separate.fName,
        lastName: separate.lName,
        imageUrl: user.image,
        role: isAdmin ? types.Role.admin : types.Role.user,
        createdAt: joinDate.millisecondsSinceEpoch,
        metadata: {
          "groupId": groupId,
          "canInteract": canInteract,
          "joinDate": joinDate.toIso8601String(),
          "isAdmin": isAdmin,
          "user": User(
            userId: user.id,
            userEmail: user.email,
            userFirstName: separate.fName,
            userLastName: separate.lName,
            userPassword: user.password,
            userType: user.userType,
            accountCreatedDatetime: joinDate,
            userStatus: UserStatus.active,
          ).toJson(),
        });
  }

  factory MemberEntity.fromAuth(types.User u) {
    final AuthUserEntity myU = User.fromJson(u.metadata?["user"] as String);
    return MemberEntity(
      user: myU,
      groupId: u.metadata?["groupId"] as int? ?? -1,
      canInteract: u.metadata?["canInteract"] as bool? ?? false,
      joinDate: DateTime.tryParse(u.metadata?["joinDate"] as String) ??
          DateTime.now(),
      isAdmin: u.metadata?["isAdmin"] as bool? ?? false,
    );
  }
}
