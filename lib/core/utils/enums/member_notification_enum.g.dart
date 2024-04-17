// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_notification_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberNotificationEnumAdapter
    extends TypeAdapter<MemberNotificationEnum> {
  @override
  final int typeId = 6;

  @override
  MemberNotificationEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MemberNotificationEnum.notify;
      case 1:
        return MemberNotificationEnum.withoutNotify;
      case 2:
        return MemberNotificationEnum.customNotify;
      default:
        return MemberNotificationEnum.notify;
    }
  }

  @override
  void write(BinaryWriter writer, MemberNotificationEnum obj) {
    switch (obj) {
      case MemberNotificationEnum.notify:
        writer.writeByte(0);
        break;
      case MemberNotificationEnum.withoutNotify:
        writer.writeByte(1);
        break;
      case MemberNotificationEnum.customNotify:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberNotificationEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
