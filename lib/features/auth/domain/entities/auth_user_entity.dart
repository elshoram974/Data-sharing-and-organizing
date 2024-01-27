import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive/hive.dart';

part 'auth_user_entity.g.dart';

@HiveType(typeId: 2)
class AuthUserEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String password;
  @HiveField(4)
  final UserRole userRole;

  const AuthUserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.userRole,
  });

  AuthUserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    UserRole? userRole,
  }) {
    return AuthUserEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userRole: userRole ?? this.userRole,
    );
  }

  factory AuthUserEntity.fromFirebaseAuth(User user) {
    return AuthUserEntity(
      id: 0,
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: user.uid,
      userRole: UserRole.personalUser,
    );
  }

  @override
  List<Object?> get props => [name, email, password, userRole];
}
