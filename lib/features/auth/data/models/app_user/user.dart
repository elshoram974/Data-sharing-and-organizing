import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';

import '../../../domain/entities/auth_user_entity.dart';

class User extends AuthUserEntity {
  final int userId;
  final String userEmail;
  final String userFirstName;
  final String userLastName;
  final String userPassword;
  final UserProvider userProvider;
  final bool userIsVerified;
  final DateTime? accountLastlogin;
  final DateTime? accountCreatedDatetime;
  final String? userImage;

  const User({
    required this.userId,
    required this.userEmail,
    required this.userFirstName,
    required this.userLastName,
    required this.userPassword,
    this.userProvider = UserProvider.emailPassword,
    required this.userIsVerified,
    this.accountLastlogin,
    this.accountCreatedDatetime,
    this.userImage,
    required super.userRole,
  }) : super(
          name: "$userFirstName $userLastName",
          email: userEmail,
          password: userPassword,
        );

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      userId: data['user_id'] as int,
      userEmail: data['user_email'] as String,
      userFirstName: data['user_first_name'] as String,
      userLastName: data['user_last_name'] as String,
      userPassword: data['user_password'] as String,
      userProvider: UserProvider.fromString(data['user_provider'] as String?),
      userIsVerified: data['user_is_verified'] == 1 ? true : false,
      accountLastlogin: DateTime.tryParse(data['account_lastlogin'] as String),
      accountCreatedDatetime: DateTime.tryParse(data['account_created_datetime'] as String),
      userImage: data['user_image'] as dynamic,
      userRole: UserRole.fromString(data['user_role'] as String?),
    );
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'user_email': userEmail,
        'user_first_name': userFirstName,
        'user_last_name': userLastName,
        'user_password': userPassword,
        'user_provider': userProvider.inString,
        'user_is_verified': userIsVerified,
        'account_lastlogin': accountLastlogin?.toIso8601String(),
        'account_created_datetime': accountCreatedDatetime?.toIso8601String(),
        'user_image': userImage,
        'user_role': userRole.inString,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
  factory User.fromJson(String data) {
    return User.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      userId,
      userEmail,
      userFirstName,
      userLastName,
      userPassword,
      userProvider,
      userIsVerified,
      accountLastlogin,
      accountCreatedDatetime,
      userImage,
      userRole,
    ];
  }
}
