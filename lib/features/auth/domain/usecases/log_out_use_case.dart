import 'dart:async';

import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_no_parameter.dart';

import '../repositories/auth_repositories.dart';

class LogOutUseCase extends UseCase<int> {
  final AuthRepositories authRepositories;

  LogOutUseCase(this.authRepositories);

  @override
  Future<Status<int>> call() {
    return authRepositories.logOut();
  }
}
