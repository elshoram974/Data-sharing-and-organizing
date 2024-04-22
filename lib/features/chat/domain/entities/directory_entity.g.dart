// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DirectoryEntityAdapter extends TypeAdapter<DirectoryEntity> {
  @override
  final int typeId = 9;

  @override
  DirectoryEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DirectoryEntity(
      id: fields[0] as int,
      name: fields[3] as String,
      insideDirectoryId: fields[4] as int?,
      groupId: fields[2] as int,
      createdBy: fields[1] as MemberEntity,
      isApproved: fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, DirectoryEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.createdBy)
      ..writeByte(2)
      ..write(obj.groupId)
      ..writeByte(3)
      ..write(obj.name)
      ..writeByte(4)
      ..write(obj.insideDirectoryId)
      ..writeByte(5)
      ..write(obj.isApproved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DirectoryEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
