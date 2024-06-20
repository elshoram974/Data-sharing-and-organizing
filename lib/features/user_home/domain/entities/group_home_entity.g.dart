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
      groupId: fields[0] as int,
      imageLink: fields[1] as String?,
      groupName: fields[2] as String,
      unReadCounter: fields[4] as int?,
      lastActivity: fields[9] as ActivityEntity?,
      ownerId: fields[5] as int,
      bottomHeight: fields[6] as double?,
      discussion: fields[7] as GroupDiscussionType,
      accessType: fields[11] as GroupAccessType,
      memberEntity: fields[8] as MemberEntity,
      createdAt: fields[10] as DateTime,
      screen: fields[12] as int,
      status:
          fields[14] == null ? GroupStatus.active : fields[14] as GroupStatus,
      statusMessage: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupHomeEntity obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.groupId)
      ..writeByte(1)
      ..write(obj.imageLink)
      ..writeByte(2)
      ..write(obj.groupName)
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
      ..write(obj.lastActivity)
      ..writeByte(10)
      ..write(obj.createdAt)
      ..writeByte(11)
      ..write(obj.accessType)
      ..writeByte(12)
      ..write(obj.screen)
      ..writeByte(14)
      ..write(obj.status)
      ..writeByte(15)
      ..write(obj.statusMessage);
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
