import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class RequestToRecoverAccountUseCase extends UseCase<User, String> {
  final AuthRepositories authRepositories;

  RequestToRecoverAccountUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(String param) {
    return authRepositories.requestToRecoverAccount(param);
  }
}
