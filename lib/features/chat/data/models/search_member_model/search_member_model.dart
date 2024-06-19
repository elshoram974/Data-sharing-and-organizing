import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'searched_member_model.dart';

class SearchMemberModel extends Equatable {
  final String status;
  final List<SearchedMemberModel> searchedMembers;

  const SearchMemberModel({
    required this.status,
    required this.searchedMembers,
  });

  factory SearchMemberModel.fromMap(Map<String, dynamic> data) {
    return SearchMemberModel(
      status: data['status'] as String,
      searchedMembers: (data['users'] as List<dynamic>)
          .map((e) => SearchedMemberModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'users': searchedMembers.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SearchMemberModel].
  factory SearchMemberModel.fromJson(String data) {
    return SearchMemberModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SearchMemberModel] to a JSON string.
  String toJson() => json.encode(toMap());

  SearchMemberModel copyWith({
    String? status,
    List<SearchedMemberModel>? users,
  }) {
    return SearchMemberModel(
      status: status ?? this.status,
      searchedMembers: users ?? this.searchedMembers,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, searchedMembers];
}
