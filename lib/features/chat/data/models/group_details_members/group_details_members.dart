import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'group_members_model.dart';

class GroupDetailsMembers extends Equatable {
  final String? status;
  final List<GroupMember>? members;

  const GroupDetailsMembers({this.status, this.members});

  factory GroupDetailsMembers.fromMap(Map<String, dynamic> data) {
    return GroupDetailsMembers(
      status: data['status'] as String?,
      members: (data['users'] as List<dynamic>?)
          ?.map((e) => GroupMember.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'users': members?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GroupDetailsMembers].
  factory GroupDetailsMembers.fromJson(String data) {
    return GroupDetailsMembers.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GroupDetailsMembers] to a JSON string.
  String toJson() => json.encode(toMap());

  GroupDetailsMembers copyWith({
    String? status,
    List<GroupMember>? users,
  }) {
    return GroupDetailsMembers(
      status: status ?? this.status,
      members: users ?? this.members,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, members];
}
