import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';

import '../../data/models/app_user/user.dart';
import '../entities/login_entity.dart';
import '../repositories/auth_repositories.dart';

final class LoginUseCase extends UseCase<User, ({UserProvider provider, LoginUserEntity user})> {
  final AuthRepositories authRepositories;

  LoginUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(({UserProvider provider, LoginUserEntity user}) param) {
    switch (param.provider) {
      case UserProvider.emailPassword:
        return authRepositories.login(param.user);

      default:
        return authRepositories.socialLogin(param);
    }
  }
}
