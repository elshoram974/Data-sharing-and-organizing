import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchedMemberModel extends Equatable {
  final int userId;
  final String firstName;
  final String lastName;
  final DateTime lastLogin;
  final String? image;

  const SearchedMemberModel({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.lastLogin,
    this.image,
  });

  factory SearchedMemberModel.fromMap(Map<String, dynamic> data) =>
      SearchedMemberModel(
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
  /// Parses the string and returns the resulting Json object as [SearchedMemberModel].
  factory SearchedMemberModel.fromJson(String data) {
    return SearchedMemberModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchedMemberModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchedMemberModel copyWith({
    int? userId,
    String? firstName,
    String? lastName,
    DateTime? lastLogin,
    String? image,
  }) {
    return SearchedMemberModel(
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
