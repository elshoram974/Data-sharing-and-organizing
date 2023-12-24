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
    UserRole role = getUserRoleFromString(data['user_role'] as String?);
    UserProvider provider =
        getUserProviderFromString(data['user_provider'] as String?);
    return User(
      userId: data['user_id'] as int,
      userEmail: data['user_email'] as String,
      userFirstName: data['user_first_name'] as String,
      userLastName: data['user_last_name'] as String,
      userPassword: data['user_password'] as String,
      userProvider: provider,
      userIsVerified: data['user_is_verified'] == 1 ? true : false,
      accountLastlogin: DateTime.tryParse(data['account_lastlogin'] as String),
      accountCreatedDatetime:
          DateTime.tryParse(data['account_created_datetime'] as String),
      userImage: data['user_image'] as dynamic,
      userRole: role,
    );
  }

  static UserRole getUserRoleFromString(String? stringRole) {
    switch (stringRole) {
      case 'personal_user':
        return UserRole.personalUser;
      case 'business_user':
        return UserRole.businessUser;
      case 'business_admin':
        return UserRole.businessAdmin;
    }
    return UserRole.personalUser;
  }

  static UserProvider getUserProviderFromString(String? stringProvider) {
    switch (stringProvider) {
      case 'facebook':
        return UserProvider.facebook;
      case 'google':
        return UserProvider.google;
      case 'email_password':
        return UserProvider.emailPassword;
    }
    return UserProvider.emailPassword;
  }

  String covertUserRoleToString(UserRole userRole) {
    switch (userRole) {
      case UserRole.personalUser:
        return 'personal_user';
      case UserRole.businessUser:
        return 'business_user';
      case UserRole.businessAdmin:
        return 'business_admin';
    }
  }

  String covertUserProviderToString(UserProvider userProvider) {
    switch (userProvider) {
      case UserProvider.facebook:
        return 'facebook';
      case UserProvider.google:
        return 'google';
      case UserProvider.emailPassword:
        return 'email_password';
    }
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'user_email': userEmail,
        'user_first_name': userFirstName,
        'user_last_name': userLastName,
        'user_password': userPassword,
        'user_provider': covertUserProviderToString(userProvider),
        'user_is_verified': userIsVerified,
        'account_lastlogin': accountLastlogin?.toIso8601String(),
        'account_created_datetime': accountCreatedDatetime?.toIso8601String(),
        'user_image': userImage,
        'user_role': covertUserRoleToString(userRole),
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
