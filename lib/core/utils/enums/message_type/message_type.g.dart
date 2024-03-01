// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageTypeAdapter extends TypeAdapter<MessageType> {
  @override
  final int typeId = 3;

  @override
  MessageType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageType.photo;
      case 1:
        return MessageType.recordFile;
      case 2:
        return MessageType.textMessage;
      case 3:
        return MessageType.voiceMessage;
      case 4:
        return MessageType.poll;
      case 5:
        return MessageType.document;
      case 6:
        return MessageType.instructions;
      case 7:
        return MessageType.video;
      case 8:
        return MessageType.location;
      case 9:
        return MessageType.other;
      default:
        return MessageType.photo;
    }
  }

  @override
  void write(BinaryWriter writer, MessageType obj) {
    switch (obj) {
      case MessageType.photo:
        writer.writeByte(0);
        break;
      case MessageType.recordFile:
        writer.writeByte(1);
        break;
      case MessageType.textMessage:
        writer.writeByte(2);
        break;
      case MessageType.voiceMessage:
        writer.writeByte(3);
        break;
      case MessageType.poll:
        writer.writeByte(4);
        break;
      case MessageType.document:
        writer.writeByte(5);
        break;
      case MessageType.instructions:
        writer.writeByte(6);
        break;
      case MessageType.video:
        writer.writeByte(7);
        break;
      case MessageType.location:
        writer.writeByte(8);
        break;
      case MessageType.other:
        writer.writeByte(9);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
