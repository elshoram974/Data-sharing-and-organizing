import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class SocialLoginUseCase extends UseCase<User, UserProvider> {
  final AuthRepositories authRepositories;

  SocialLoginUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(UserProvider param) {
    return authRepositories.socialLogin(param);
  }
}
