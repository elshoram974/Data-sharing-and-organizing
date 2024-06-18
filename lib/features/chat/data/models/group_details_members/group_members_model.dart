import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'group_members_model.g.dart';

@HiveType(typeId: 13)
class GroupMember extends Equatable {
  @HiveField(1)
  final int groupId;
  @HiveField(2)
  final int memberId;
  @HiveField(3)
  final bool canInteraction;
  @HiveField(4)
  final NotificationEnum notification;
  @HiveField(5)
  final DateTime joinDate;
  @HiveField(6)
  final bool isAdmin;
  @HiveField(7)
  final String email;
  @HiveField(8)
  final String firstName;
  @HiveField(9)
  final String lastName;
  @HiveField(10)
  final DateTime lastLogin;
  @HiveField(11)
  final String? image;

  const GroupMember({
    required this.groupId,
    required this.memberId,
    required this.canInteraction,
    required this.notification,
    required this.joinDate,
    required this.isAdmin,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.lastLogin,
    this.image,
  });

  factory GroupMember.fromMap(Map<String, dynamic> data) {
    final NotificationEnum notification =
        NotificationEnum.fromString(data['member_notification'] as String);
    return GroupMember(
      groupId: data['group_id'] as int,
      memberId: data['member_id'] as int,
      canInteraction: (data['member_can_interaction'] as int?) == 1,
      notification: notification,
      joinDate: DateTime.parse(data['member_join_date'] as String),
      isAdmin: (data['member_is_admin'] as int?) == 1,
      email: data['user_email'] as String,
      firstName: data['user_first_name'] as String,
      lastName: data['user_last_name'] as String,
      lastLogin: DateTime.parse(data['user_lastlogin'] as String),
      image: data['user_image'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'group_id': groupId,
        'member_id': memberId,
        'member_can_interaction': canInteraction ? 1 : 0,
        'member_notification': notification.inString,
        'member_join_date': joinDate.toIso8601String(),
        'member_is_admin': isAdmin ? 1 : 0,
        'user_email': email,
        'user_first_name': firstName,
        'user_last_name': lastName,
        'user_lastlogin': lastLogin.toIso8601String(),
        'user_image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GroupMember].
  factory GroupMember.fromJson(String data) {
    return GroupMember.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GroupMember] to a JSON string.
  String toJson() => json.encode(toMap());

  GroupMember copyWith({
    int? groupId,
    int? memberId,
    bool? canInteraction,
    NotificationEnum? notification,
    DateTime? joinDate,
    bool? isAdmin,
    String? email,
    String? firstName,
    String? lastName,
    DateTime? lastLogin,
    String? image,
  }) {
    return GroupMember(
      groupId: groupId ?? this.groupId,
      memberId: memberId ?? this.memberId,
      canInteraction: canInteraction ?? this.canInteraction,
      notification: notification ?? this.notification,
      joinDate: joinDate ?? this.joinDate,
      isAdmin: isAdmin ?? this.isAdmin,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      lastLogin: lastLogin ?? this.lastLogin,
      image: image ?? this.image,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      groupId,
      memberId,
      canInteraction,
      notification,
      joinDate,
      isAdmin,
      email,
      firstName,
      lastName,
      lastLogin,
      image,
    ];
  }
}
