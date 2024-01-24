import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';

import '../../data/models/app_user/user.dart';
import '../repositories/auth_repositories.dart';

final class NewPasswordUseCase extends UseCase<User, ({int id , String newPass})> {
  final AuthRepositories authRepositories;

  NewPasswordUseCase(this.authRepositories);

  @override
  Future<Status<User>> call(({int id , String newPass}) param) {
    return authRepositories.newPassword(param);
  }
}
