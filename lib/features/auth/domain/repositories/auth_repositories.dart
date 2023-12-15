import 'package:data_sharing_organizing/core/status/status.dart';

import '../entities/auth_user_entity.dart';

abstract class AuthRepositories {
  Future<Status<AuthUserEntity>> login(AuthUserEntity user);
  Future<Status<int>> logOut();
  Status<bool> isLoggedIn();
  Future<Status<AuthUserEntity>> signUp(AuthUserEntity user);
  Future<Status<AuthUserEntity>> requestToRecoverAccount(String email);
  Future<Status<AuthUserEntity>> verifyCode(int code);
}
