import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'ai_reply.dart';

class AiResponse extends Equatable {
  final List<AiReply>? aiReplies;

  const AiResponse({this.aiReplies});

  factory AiResponse.fromMap(Map<String, dynamic> data) => AiResponse(
        aiReplies: (data['responses'] as List<dynamic>?)
            ?.map((e) => AiReply.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'responses': aiReplies?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AiResponse].
  factory AiResponse.fromJson(String data) {
    return AiResponse.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AiResponse] to a JSON string.
  String toJson() => json.encode(toMap());

  AiResponse copyWith({
    List<AiReply>? responses,
  }) {
    return AiResponse(
      aiReplies: responses ?? this.aiReplies,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [aiReplies];
}
