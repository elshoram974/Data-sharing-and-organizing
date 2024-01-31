import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_no_parameter.dart';

import '../entities/auth_user_entity.dart';
import '../repositories/auth_repositories.dart';

final class GetCurrentUserUseCase extends UseCase<AuthUserEntity?> {
  final AuthRepositories authRepositories;

  GetCurrentUserUseCase(this.authRepositories);

  @override
  Status<AuthUserEntity?> call() {
    return authRepositories.currentUser();
  }
}
