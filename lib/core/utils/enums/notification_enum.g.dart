// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationEnumAdapter extends TypeAdapter<NotificationEnum> {
  @override
  final int typeId = 6;

  @override
  NotificationEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return NotificationEnum.notify;
      case 1:
        return NotificationEnum.withoutNotify;
      case 2:
        return NotificationEnum.customNotify;
      default:
        return NotificationEnum.notify;
    }
  }

  @override
  void write(BinaryWriter writer, NotificationEnum obj) {
    switch (obj) {
      case NotificationEnum.notify:
        writer.writeByte(0);
        break;
      case NotificationEnum.withoutNotify:
        writer.writeByte(1);
        break;
      case NotificationEnum.customNotify:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
