import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'message_type.g.dart';

@HiveType(typeId: 3)
enum MessageType {
  @HiveField(0)
  photo('photo'),

  @HiveField(1)
  recordFile('record_file'),

  @HiveField(2)
  textMessage('text_message'),

  @HiveField(3)
  voiceMessage('voice_message'),

  @HiveField(4)
  poll('poll'),

  @HiveField(5)
  document('document'),

  @HiveField(6)
  instructions('instructions'),

  @HiveField(7)
  video('video'),

  @HiveField(8)
  location('location'),

  @HiveField(9)
  other('other');

  final String inString;
  const MessageType(this.inString);

  factory MessageType.fromString(String? stringRole) {
    Map<String, MessageType> map = {};
    for (MessageType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? other;
  }

  IconData? icon() {
    switch (this) {
      case photo:
        return Icons.photo_outlined;
      case recordFile:
        return Icons.audio_file_outlined;
      case textMessage:
        return null;
      case voiceMessage:
        return Icons.mic_none_outlined;
      case document:
        return Icons.insert_drive_file_outlined;
      case video:
        return Icons.video_collection_outlined;
      case location:
        return Icons.location_on_outlined;
      case instructions:
        return Icons.info_outline;
      case poll:
        return Icons.how_to_vote_outlined;
      case other:
      default:
        return null;
    }
  }
}
