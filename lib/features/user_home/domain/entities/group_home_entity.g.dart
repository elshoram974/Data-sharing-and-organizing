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
      lastMessage: fields[7] as String?,
      lastMessageType: fields[9] as MessageType?,
      lastMessageFrom: fields[8] as String?,
      unReadCounter: fields[4] as int?,
      isUnread: fields[5] as bool,
      lastMessageTime: fields[6] as DateTime?,
      isMute: fields[3] as bool,
      ownerId: fields[10] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GroupHomeEntity obj) {
    writer
      ..writeByte(11)
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
      ..write(obj.isUnread)
      ..writeByte(6)
      ..write(obj.lastMessageTime)
      ..writeByte(7)
      ..write(obj.lastMessage)
      ..writeByte(8)
      ..write(obj.lastMessageFrom)
      ..writeByte(9)
      ..write(obj.lastMessageType)
      ..writeByte(10)
      ..write(obj.ownerId);
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
