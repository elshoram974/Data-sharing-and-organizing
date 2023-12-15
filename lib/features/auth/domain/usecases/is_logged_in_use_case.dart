import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_no_parameter.dart';

import '../repositories/auth_repositories.dart';

final class IsLoggedInUseCase extends UseCase<bool> {
  final AuthRepositories authRepositories;

  IsLoggedInUseCase(this.authRepositories);

  @override
  Status<bool> call() {
    return authRepositories.isLoggedIn();
  }
}
