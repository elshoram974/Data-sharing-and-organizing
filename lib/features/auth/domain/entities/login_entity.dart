import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

final class LoginUserEntity extends AuthUserEntity {
  final bool keepLogin;
  const LoginUserEntity({
    required super.email,
    required super.password,
    this.keepLogin = true,
  }) : super(name: '', accountType: AccountType.personal);

  factory LoginUserEntity.none() =>
      const LoginUserEntity(email: '', password: '');

  @override
  LoginUserEntity copyWith({
    String? name,
    String? email,
    String? password,
    AccountType? accountType,
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
