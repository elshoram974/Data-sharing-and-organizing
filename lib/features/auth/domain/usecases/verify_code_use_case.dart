import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class VerifyCodeUseCase extends UseCase<User, ({String code, int id, VerificationType verification})> {
  final AuthRepositories authRepositories;

  VerifyCodeUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(({String code, int id, VerificationType verification}) param) {
    return authRepositories.verifyCode(param);
  }
}
