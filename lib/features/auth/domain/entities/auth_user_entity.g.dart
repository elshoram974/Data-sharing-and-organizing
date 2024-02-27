// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthUserEntityAdapter extends TypeAdapter<AuthUserEntity> {
  @override
  final int typeId = 2;

  @override
  AuthUserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthUserEntity(
      image: fields[2] as String?,
      id: fields[0] as int,
      name: fields[1] as String,
      email: fields[3] as String,
      password: fields[4] as String,
      userType: fields[5] as UserType,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.password)
      ..writeByte(5)
      ..write(obj.userType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
