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
    for (MessageType e in MessageType.values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? MessageType.other;
  }

  IconData? icon() {
    switch (this) {
      case MessageType.photo:
        return Icons.photo_outlined;
      case MessageType.recordFile:
        return Icons.audio_file_outlined;
      case MessageType.textMessage:
        return null;
      case MessageType.voiceMessage:
        return Icons.mic_outlined;
      case MessageType.document:
        return Icons.insert_drive_file_outlined;
      case MessageType.video:
        return Icons.video_collection_outlined;
      case MessageType.location:
        return Icons.location_on_outlined;
      case MessageType.instructions:
        return Icons.info_outline;
      case MessageType.poll:
        return Icons.how_to_vote_outlined;
      case MessageType.other:
      default:
        return null;
    }
  }
}
