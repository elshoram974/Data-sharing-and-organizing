import 'dart:convert';

import '../../../../auth/data/models/app_user/user.dart';
import 'group.dart';

class HomeData {
  String status;
  List<GroupDetails> groups;
  User user;

  HomeData({required this.status, required this.groups, required this.user});

  @override
  String toString() {
    return 'HomeData(status: $status, groups: $groups, user: $user)';
  }

  factory HomeData.fromMap(Map<String, dynamic> data) => HomeData(
        status: data['status'] as String,
        groups: (data['groups'] as List<Map<String, dynamic>>)
            .map((e) => GroupDetails.fromMap(e))
            .toList(),
        user: User.fromMap(data['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'groups': groups.map((e) => e.toMap()).toList(),
        'user': user.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HomeData].
  factory HomeData.fromJson(String data) {
    return HomeData.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HomeData] to a JSON string.
  String toJson() => json.encode(toMap());

  HomeData copyWith({
    String? status,
    List<GroupDetails>? groups,
    User? user,
  }) {
    return HomeData(
      status: status ?? this.status,
      groups: groups ?? this.groups,
      user: user ?? this.user,
    );
  }
}
