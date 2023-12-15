import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../repositories/auth_repositories.dart';

final class LoginUseCase extends UseCase<AuthUserEntity,AuthUserEntity> {
  final AuthRepositories authRepositories;

  LoginUseCase(this.authRepositories);
  
  @override
  Future<Status<AuthUserEntity>> call(AuthUserEntity param) {
    return authRepositories.login(param);
  }
}
