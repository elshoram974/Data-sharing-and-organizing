// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_status_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupStatusAdapter extends TypeAdapter<GroupStatus> {
  @override
  final int typeId = 15;

  @override
  GroupStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 1:
        return GroupStatus.active;
      case 2:
        return GroupStatus.inactive;
      case 3:
        return GroupStatus.suspended;
      case 4:
        return GroupStatus.deleted;
      case 5:
        return GroupStatus.pending;
      default:
        return GroupStatus.active;
    }
  }

  @override
  void write(BinaryWriter writer, GroupStatus obj) {
    switch (obj) {
      case GroupStatus.active:
        writer.writeByte(1);
        break;
      case GroupStatus.inactive:
        writer.writeByte(2);
        break;
      case GroupStatus.suspended:
        writer.writeByte(3);
        break;
      case GroupStatus.deleted:
        writer.writeByte(4);
        break;
      case GroupStatus.pending:
        writer.writeByte(5);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
