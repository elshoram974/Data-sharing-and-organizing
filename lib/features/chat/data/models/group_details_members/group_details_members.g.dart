// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_details_members.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupDetailsMembersAdapter extends TypeAdapter<GroupDetailsMembers> {
  @override
  final int typeId = 14;

  @override
  GroupDetailsMembers read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GroupDetailsMembers(
      status: fields[1] as String,
      members: (fields[2] as List).cast<GroupMember>(),
    );
  }

  @override
  void write(BinaryWriter writer, GroupDetailsMembers obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.status)
      ..writeByte(2)
      ..write(obj.members);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupDetailsMembersAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
