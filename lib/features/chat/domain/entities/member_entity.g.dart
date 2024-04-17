// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MemberEntityAdapter extends TypeAdapter<MemberEntity> {
  @override
  final int typeId = 7;

  @override
  MemberEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MemberEntity(
      user: fields[0] as AuthUserEntity,
      groupId: fields[5] as int,
      canInteract: fields[1] as bool,
      notification: fields[2] == null
          ? NotificationEnum.notify
          : fields[2] as NotificationEnum,
      joinDate: fields[3] as DateTime,
      isAdmin: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MemberEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.user)
      ..writeByte(1)
      ..write(obj.canInteract)
      ..writeByte(2)
      ..write(obj.notification)
      ..writeByte(3)
      ..write(obj.joinDate)
      ..writeByte(4)
      ..write(obj.isAdmin)
      ..writeByte(5)
      ..write(obj.groupId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MemberEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
