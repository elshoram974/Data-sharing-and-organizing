import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchedUserModel extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;
  final DateTime lastLogin;
  final String? image;

  const SearchedUserModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.lastLogin,
    this.image,
  });

  factory SearchedUserModel.fromMap(Map<String, dynamic> data) =>
      SearchedUserModel(
        userId: data['user_id'] as int,
        firstName: data['user_first_name'] as String,
        lastName: data['user_last_name'] as String,
        lastLogin: DateTime.parse(data['user_lastlogin'] as String),
        image: data['user_image'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'user_id': userId,
        'user_first_name': firstName,
        'user_last_name': lastName,
        'user_lastlogin': lastLogin,
        'user_image': image,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchedUserModel].
  factory SearchedUserModel.fromJson(String data) {
    return SearchedUserModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchedUserModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchedUserModel copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    DateTime? lastLogin,
    String? image,
  }) {
    return SearchedUserModel(
      userId: userId ?? this.userId,
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
      userId,
      firstName,
      lastName,
      lastLogin,
      image,
    ];
  }
}
