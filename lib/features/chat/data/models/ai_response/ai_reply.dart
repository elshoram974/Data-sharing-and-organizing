import 'dart:convert';

import 'package:equatable/equatable.dart';

class AiReply extends Equatable {
  final List<int>? activities;
  final String? message;
  final int? groupId;

  const AiReply({this.activities, this.message, required this.groupId});

  factory AiReply.fromMap(Map<String, dynamic> data) => AiReply(
        activities: (data['activities'] as List<dynamic>?)?.cast<int>(),
        message: data['message'] as String?,
        groupId: data['group_id'] as int?,
      );

  Map<String, dynamic> toMap() => {
        'activities': activities,
        'message': message,
        'group_id': groupId,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AiReply].
  factory AiReply.fromJson(String data) {
    return AiReply.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AiReply] to a JSON string.
  String toJson() => json.encode(toMap());

  AiReply copyWith({
    List<int>? activities,
    String? message,
    int? groupId,
  }) {
    return AiReply(
      activities: activities ?? this.activities,
      message: message ?? this.message,
      groupId: groupId ?? this.groupId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [activities, message, groupId];
}
