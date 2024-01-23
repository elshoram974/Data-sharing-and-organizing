import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../data/models/app_user/user.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repositories.dart';

final class LoginUseCase extends UseCase<User, LoginUserEntity> {
  final AuthRepositories authRepositories;

  LoginUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(LoginUserEntity param) {
    return authRepositories.login(param);
  }
}
