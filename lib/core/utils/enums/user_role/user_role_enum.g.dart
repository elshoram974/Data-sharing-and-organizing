// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_role_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserRoleAdapter extends TypeAdapter<UserRole> {
  @override
  final int typeId = 1;

  @override
  UserRole read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return UserRole.personalUser;
      case 1:
        return UserRole.businessUser;
      case 2:
        return UserRole.businessAdmin;
      default:
        return UserRole.personalUser;
    }
  }

  @override
  void write(BinaryWriter writer, UserRole obj) {
    switch (obj) {
      case UserRole.personalUser:
        writer.writeByte(0);
        break;
      case UserRole.businessUser:
        writer.writeByte(1);
        break;
      case UserRole.businessAdmin:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserRoleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
