import 'dart:convert';

import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';

import '../../../domain/entities/auth_user_entity.dart';

class User extends AuthUserEntity {
  final int userId;
  final String userEmail;
  final String userFirstName;
  final String userLastName;
  final String userPassword;
  final UserProvider userProvider;
  final DateTime? accountLastlogin;
  final DateTime? accountCreatedDatetime;
  final String? userImage;
  final UserStatus userStatus;
  final String? userStatusMessage;

  const User({
    required this.userId,
    required this.userEmail,
    required this.userFirstName,
    required this.userLastName,
    required this.userPassword,
    this.userProvider = UserProvider.emailPassword,
    this.accountLastlogin,
    this.accountCreatedDatetime,
    this.userImage,
    required super.userType,
    required this.userStatus,
    this.userStatusMessage,
  }) : super(
          id: userId,
          name: "$userFirstName $userLastName",
          email: userEmail,
          password: userPassword,
          image: userImage,
        );

  @override
  User copyWith({
    int? id,
    String? image,
    String? firstName,
    String? lastName,
    String? name,
    String? email,
    String? password,
    UserType? userType,
    UserStatus? userStatus,
    String? userStatusMessage,
    DateTime? accountCreatedDatetime,
    DateTime? accountLastlogin,
    UserProvider? userProvider,
  }) {
    assert(name == null, 'don\'t put name in name Field');
    return User(
      userId: id ?? userId,
      userEmail: email ?? userEmail,
      userFirstName: firstName ?? userFirstName,
      userLastName: lastName ?? userLastName,
      userPassword: password ?? userPassword,
      userType: userType ?? this.userType,
      userStatus: userStatus ?? this.userStatus,
      userStatusMessage: userStatusMessage ?? this.userStatusMessage,
      userImage: image ?? this.image,
      accountCreatedDatetime: accountCreatedDatetime ??this.accountCreatedDatetime,
      accountLastlogin:  accountLastlogin ?? this.accountLastlogin,
      userProvider: userProvider ?? this.userProvider,
    );
  }

  factory User.fromMap(Map<String, dynamic> data) {
    return User(
      userId: data['user_id'] as int,
      userEmail: data['user_email'] as String,
      userFirstName: data['user_first_name'] as String,
      userLastName: data['user_last_name'] as String,
      userPassword: data['user_password'] as String,
      userProvider: UserProvider.fromString(data['user_provider'] as String?),
      accountLastlogin: DateTime.tryParse(data['user_lastlogin'] as String),
      accountCreatedDatetime:
          DateTime.tryParse(data['user_createdat'] as String),
      userImage: data['user_image'] as dynamic,
      userType: UserType.fromString(data['user_type'] as String?),
      userStatus: UserStatus.fromString(data['user_status'] as String),
      userStatusMessage: data['user_status_message'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'user_email': userEmail,
        'user_first_name': userFirstName,
        'user_last_name': userLastName,
        'user_password': userPassword,
        'user_provider': userProvider.inString,
        'user_lastlogin': accountLastlogin?.toIso8601String(),
        'user_createdat': accountCreatedDatetime?.toIso8601String(),
        'user_image': userImage,
        'user_type': userType.inString,
        'user_status': userStatus.inString,
        'user_status_message': userStatusMessage,
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
      accountLastlogin,
      accountCreatedDatetime,
      userImage,
      userType,
      userStatus,
      userStatusMessage,
    ];
  }
}
