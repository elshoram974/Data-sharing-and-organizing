import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../repositories/auth_repositories.dart';

final class VerifyCodeUseCase extends UseCase<AuthUserEntity, int> {
  final AuthRepositories authRepositories;

  VerifyCodeUseCase(this.authRepositories);

  @override
  Future<Status<AuthUserEntity>> call(int param) {
    return authRepositories.verifyCode(param);
  }
}
