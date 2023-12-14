import 'dart:async';

import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/usecase/usecase_with_parameter.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../repositories/auth_repositories.dart';

class RequestToRecoverAccountUseCase extends UseCase<AuthUserEntity, String> {
  final AuthRepositories authRepositories;

  RequestToRecoverAccountUseCase(this.authRepositories);

  @override
  FutureOr<Status<AuthUserEntity>> call(String param) {
    return authRepositories.requestToRecoverAccount(param);
  }
}
