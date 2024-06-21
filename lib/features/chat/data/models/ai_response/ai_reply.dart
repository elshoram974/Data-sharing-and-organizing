import 'dart:convert';

import 'package:equatable/equatable.dart';

class AiReply extends Equatable {
  final List<int>? activities;
  final String? message;

  const AiReply({this.activities, this.message});

  factory AiReply.fromMap(Map<String, dynamic> data) => AiReply(
        activities: data['activities'] as List<int>?,
        message: data['message'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'activities': activities,
        'message': message,
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
  }) {
    return AiReply(
      activities: activities ?? this.activities,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [activities, message];
}
