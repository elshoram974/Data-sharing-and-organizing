// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_home_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupHomeEntityAdapter extends TypeAdapter<GroupHomeEntity> {
  @override
  final int typeId = 4;

  @override
  GroupHomeEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupHomeEntity(
      id: fields[0] as int,
      imageLink: fields[1] as String?,
      groupName: fields[2] as String,
      unReadCounter: fields[4] as int?,
      lastActivity: fields[9] as ActivityEntity?,
      isMute: fields[3] as bool,
      ownerId: fields[5] as int,
      bottomHeight: fields[6] as double?,
      discussion: fields[7] as GroupDiscussionType,
      memberEntity: fields[8] as MemberEntity,
    );
  }

  @override
  void write(BinaryWriter writer, GroupHomeEntity obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imageLink)
      ..writeByte(2)
      ..write(obj.groupName)
      ..writeByte(3)
      ..write(obj.isMute)
      ..writeByte(4)
      ..write(obj.unReadCounter)
      ..writeByte(5)
      ..write(obj.ownerId)
      ..writeByte(6)
      ..write(obj.bottomHeight)
      ..writeByte(7)
      ..write(obj.discussion)
      ..writeByte(8)
      ..write(obj.memberEntity)
      ..writeByte(9)
      ..write(obj.lastActivity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupHomeEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
