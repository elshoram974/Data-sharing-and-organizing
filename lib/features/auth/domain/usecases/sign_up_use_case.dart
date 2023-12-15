import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../repositories/auth_repositories.dart';

final class SignUpUseCase extends UseCase<AuthUserEntity,AuthUserEntity> {
  final AuthRepositories authRepositories;

  SignUpUseCase(this.authRepositories);
  
  @override
  Future<Status<AuthUserEntity>> call(AuthUserEntity param) {
    return authRepositories.signUp(param);
  }
}
