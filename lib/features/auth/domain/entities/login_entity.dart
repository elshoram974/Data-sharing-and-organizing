import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

final class LoginUserEntity extends AuthUserEntity {
  final bool keepLogin;
  const LoginUserEntity({
    required super.email,
    required super.password,
    this.keepLogin = true,
  }) : super(id:0, name: '', userType: UserType.personal);

  factory LoginUserEntity.none() =>
      const LoginUserEntity(email: '', password: '');

  @override
  LoginUserEntity copyWith({
    int? id,
    String? name,
    String? image,
    String? email,
    String? password,
    UserType? userType,
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
