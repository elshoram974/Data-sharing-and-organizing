// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_members_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupMemberAdapter extends TypeAdapter<GroupMember> {
  @override
  final int typeId = 13;

  @override
  GroupMember read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupMember(
      groupId: fields[1] as int,
      memberId: fields[2] as int,
      canInteraction: fields[3] as bool,
      notification: fields[4] as NotificationEnum,
      joinDate: fields[5] as DateTime,
      isAdmin: fields[6] as bool,
      email: fields[7] as String,
      firstName: fields[8] as String,
      lastName: fields[9] as String,
      lastLogin: fields[10] as DateTime,
      image: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GroupMember obj) {
    writer
      ..writeByte(11)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.memberId)
      ..writeByte(3)
      ..write(obj.canInteraction)
      ..writeByte(4)
      ..write(obj.notification)
      ..writeByte(5)
      ..write(obj.joinDate)
      ..writeByte(6)
      ..write(obj.isAdmin)
      ..writeByte(7)
      ..write(obj.email)
      ..writeByte(8)
      ..write(obj.firstName)
      ..writeByte(9)
      ..write(obj.lastName)
      ..writeByte(10)
      ..write(obj.lastLogin)
      ..writeByte(11)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupMemberAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
