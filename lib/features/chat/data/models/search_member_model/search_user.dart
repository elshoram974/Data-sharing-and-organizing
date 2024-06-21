import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'searched_user_model.dart';

class SearchUser extends Equatable {
  final String status;
  final List<SearchedUserModel> searchedUsers;

  const SearchUser({
    required this.status,
    required this.searchedUsers,
  });

  factory SearchUser.fromMap(Map<String, dynamic> data) {
    return SearchUser(
      status: data['status'] as String,
      searchedUsers: (data['users'] as List<dynamic>?)
              ?.map((e) => SearchedUserModel.fromMap(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'users': searchedUsers.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchUser].
  factory SearchUser.fromJson(String data) {
    return SearchUser.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchUser] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchUser copyWith({
    String? status,
    List<SearchedUserModel>? searchedUsers,
  }) {
    return SearchUser(
      status: status ?? this.status,
      searchedUsers: searchedUsers ?? this.searchedUsers,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, searchedUsers];
}
