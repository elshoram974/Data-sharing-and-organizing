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
      name: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String,
      accountType: fields[3] as AccountType,
    );
  }

  @override
  void write(BinaryWriter writer, AuthUserEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.accountType);
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
