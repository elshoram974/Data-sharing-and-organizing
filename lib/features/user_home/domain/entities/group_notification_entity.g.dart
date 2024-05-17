// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_notification_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupNotificationEntityAdapter
    extends TypeAdapter<GroupNotificationEntity> {
  @override
  final int typeId = 12;

  @override
  GroupNotificationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupNotificationEntity(
      id: fields[0] as int,
      imageLink: fields[1] as String?,
      groupName: fields[2] as String,
      lastActivity: fields[9] as ActivityEntity?,
      unReadCounter: fields[4] as int?,
      ownerId: fields[5] as int,
      bottomHeight: fields[6] as double?,
      discussion: fields[7] as GroupDiscussionType,
      accessType: fields[11] as GroupAccessType,
      memberEntity: fields[8] as MemberEntity,
      createdAt: fields[10] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, GroupNotificationEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
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
      ..write(obj.accessType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupNotificationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
