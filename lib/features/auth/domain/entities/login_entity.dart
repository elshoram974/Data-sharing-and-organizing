import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

final class LoginUserEntity extends AuthUserEntity {
  const LoginUserEntity({
    required super.email,
    required super.password,
  }) : super(name: '', accountType: AccountType.personal);

  @override
  List<Object?> get props => [email, password];
}
