// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_discussion_type_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupDiscussionTypeAdapter extends TypeAdapter<GroupDiscussionType> {
  @override
  final int typeId = 5;

  @override
  GroupDiscussionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return GroupDiscussionType.exist;
      case 1:
        return GroupDiscussionType.notExist;
      case 2:
        return GroupDiscussionType.existButClosed;
      default:
        return GroupDiscussionType.exist;
    }
  }

  @override
  void write(BinaryWriter writer, GroupDiscussionType obj) {
    switch (obj) {
      case GroupDiscussionType.exist:
        writer.writeByte(0);
        break;
      case GroupDiscussionType.notExist:
        writer.writeByte(1);
        break;
      case GroupDiscussionType.existButClosed:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupDiscussionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
