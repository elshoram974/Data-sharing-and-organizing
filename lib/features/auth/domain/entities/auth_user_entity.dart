import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
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
  final String? image;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String password;
  @HiveField(5)
  final UserType userType;

  const AuthUserEntity({
    this.image,
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  AuthUserEntity copyWith({
    int? id,
    String? image,
    String? name,
    String? email,
    String? password,
    UserType? userType,
  }) {
    return AuthUserEntity(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
    );
  }

  factory AuthUserEntity.fromFirebaseAuth(User user) {
    return AuthUserEntity(
      id: 0,
      image: user.photoURL ?? '',
      name: user.displayName ?? '',
      email: user.email ?? '',
      password: user.uid,
      userType: UserType.personal,
    );
  }

  @override
  List<Object?> get props => [name, image, email, password, userType];
}
