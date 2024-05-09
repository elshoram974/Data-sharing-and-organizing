// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_access_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupAccessTypeAdapter extends TypeAdapter<GroupAccessType> {
  @override
  final int typeId = 11;

  @override
  GroupAccessType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GroupAccessType.onlyRead;
      case 1:
        return GroupAccessType.readWrite;
      case 2:
        return GroupAccessType.readWriteWithAdminPermission;
      default:
        return GroupAccessType.onlyRead;
    }
  }

  @override
  void write(BinaryWriter writer, GroupAccessType obj) {
    switch (obj) {
      case GroupAccessType.onlyRead:
        writer.writeByte(0);
        break;
      case GroupAccessType.readWrite:
        writer.writeByte(1);
        break;
      case GroupAccessType.readWriteWithAdminPermission:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAccessTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
