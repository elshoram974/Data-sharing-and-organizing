// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ActivityEntityAdapter extends TypeAdapter<ActivityEntity> {
  @override
  final int typeId = 8;

  @override
  ActivityEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ActivityEntity(
      id: fields[0] as int,
      groupId: fields[1] as int,
      createdBy: fields[2] as MemberEntity,
      insideDirectoryId: fields[3] as int?,
      repliedOn: fields[4] as int?,
      content: fields[5] as String,
      attachment: fields[6] as AttachmentModel?,
      createdAt: fields[7] as DateTime,
      isApproved: fields[8] as bool,
      notifyOthers: fields[9] as NotificationEnum,
      type: fields[10] as MessageType,
    );
  }

  @override
  void write(BinaryWriter writer, ActivityEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.groupId)
      ..writeByte(2)
      ..write(obj.createdBy)
      ..writeByte(3)
      ..write(obj.insideDirectoryId)
      ..writeByte(4)
      ..write(obj.repliedOn)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.attachment)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.isApproved)
      ..writeByte(9)
      ..write(obj.notifyOthers)
      ..writeByte(10)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ActivityEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
