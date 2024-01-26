import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class RequestToSendCodeUseCase extends UseCase<User, ({String email, VerificationType verification})> {
  final AuthRepositories authRepositories;

  RequestToSendCodeUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(({String email, VerificationType verification}) param) {
    return authRepositories.requestToSendCode(param);
  }
}
