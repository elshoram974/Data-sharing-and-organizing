import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class VerifyCodeUseCase extends UseCase<User, int> {
  final AuthRepositories authRepositories;

  VerifyCodeUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(int param) {
    return authRepositories.verifyCode(param);
  }
}
