import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

final class LoginUserEntity extends AuthUserEntity {
  final bool keepLogin;
  const LoginUserEntity({
    required super.email,
    required super.password,
    this.keepLogin = true,
  }) : super(id:0, name: '', userRole: UserRole.personalUser);

  factory LoginUserEntity.none() =>
      const LoginUserEntity(email: '', password: '');

  @override
  LoginUserEntity copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    UserRole? userRole,
    bool? keepLogin,
  }) {
    return LoginUserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      keepLogin: keepLogin ?? this.keepLogin,
    );
  }

  @override
  List<Object?> get props => [email, password, keepLogin];
}
