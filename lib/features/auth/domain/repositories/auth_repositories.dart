import 'package:data_sharing_organizing/core/status/status.dart';

import '../entities/auth_user_entity.dart';

abstract class AuthRepositories {
  Future<Status> login(AuthUserEntity user);
  Future<Status> signUp(AuthUserEntity user);
  Future<Status> requestToRecoverAccount(String email);
  Future<Status> verifyCode(int code);
}