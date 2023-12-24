import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'user.dart';

class AppUser extends Equatable {
  final String? status;
  final User? user;

  const AppUser({this.status, this.user});

  factory AppUser.fromMap(Map<String, dynamic> data) => AppUser(
        status: data['status'] as String?,
        user: data['user'] == null
            ? null
            : User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'user': user?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AppUser].
  factory AppUser.fromJson(String data) {
    return AppUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AppUser] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, user];
}
