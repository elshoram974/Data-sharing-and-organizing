import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/separate_name.dart';

import '../../../../core/utils/enums/notification_enum.dart';
import '../../../auth/data/models/app_user/user.dart';
import '../../domain/entities/member_entity.dart';

class MemberModel extends MemberEntity {
  const MemberModel({
    required super.user,
    required super.groupId,
    required super.canInteract,
    required super.notification,
    required super.joinDate,
    required super.isAdmin,
  });

  factory MemberModel.fromMap(Map<String, dynamic> map) {
    return MemberModel(
      user: User.fromMap(map['user'] as Map<String, dynamic>),
      groupId: map['groupId'] as int,
      canInteract: map['canInteract'] as bool,
      notification: NotificationEnum.fromString(map['notification'] as String?),
      joinDate: DateTime.parse(map['joinDate'] as String),
      isAdmin: map['isAdmin'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    final ({String fName, String lName}) separate = separateName(user.name);

    return {
      'user': User(
        userId: user.id,
        userEmail: user.email,
        userFirstName: separate.fName,
        userLastName: separate.lName,
        userPassword: user.password,
        userType: user.userType,
        userStatus: UserStatus.active,
        userImage: user.image,
      ).toMap(), // Assuming AuthUserEntity has a toMap method
      'groupId': groupId,
      'canInteract': canInteract,
      'notification': notification.inString,
      'joinDate': joinDate.toIso8601String(),
      'isAdmin': isAdmin,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppUser].
  factory MemberModel.fromJson(String data) {
    return MemberModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MemberModel] to a JSON string.
  String toJson() => json.encode(toMap());

  factory MemberModel.fromEntity(MemberEntity entity) {
    return MemberModel(
      user: entity.user,
      groupId: entity.groupId,
      canInteract: entity.canInteract,
      notification: entity.notification,
      joinDate: entity.joinDate,
      isAdmin: entity.isAdmin,
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
