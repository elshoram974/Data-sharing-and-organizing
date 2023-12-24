import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'auth_user_entity.g.dart';

@HiveType(typeId: 2)
class AuthUserEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final UserRole userRole;

  const AuthUserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.userRole,
  });

  AuthUserEntity copyWith({
    String? name,
    String? email,
    String? password,
    UserRole? userRole,
  }) {
    return AuthUserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userRole: userRole ?? this.userRole,
    );
  }

  @override
  List<Object?> get props => [name, email, password, userRole];
}
