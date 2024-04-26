// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttachmentModelAdapter extends TypeAdapter<AttachmentModel> {
  @override
  final int typeId = 10;

  @override
  AttachmentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AttachmentModel(
      size: fields[0] as double,
      file: (fields[4] as List).cast<int>(),
      mimeType: fields[1] as String?,
      name: fields[2] as String,
      uri: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AttachmentModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.size)
      ..writeByte(1)
      ..write(obj.mimeType)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.uri)
      ..writeByte(4)
      ..write(obj.file);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
