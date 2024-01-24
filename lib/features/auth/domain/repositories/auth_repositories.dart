import 'package:data_sharing_organizing/core/status/status.dart';

import '../../data/models/app_user/user.dart';
import '../entities/auth_user_entity.dart';
import '../entities/login_entity.dart';

abstract class AuthRepositories {
  Future<Status<User>> login(LoginUserEntity user);
  Future<Status<User>> loginWithGoogle(LoginUserEntity user);
  Future<Status<User>> loginWithFacebook(LoginUserEntity user);
  Future<Status<int>> logOut();
  Status<bool> isLoggedIn();
  Future<Status<User>> signUp(AuthUserEntity user);
  Future<Status<User>> requestToRecoverAccount(String email);
  Future<Status<User>> requestToSendCode(int id);
  Future<Status<User>> verifyCode(({int id , int code}) param);
  Future<Status<User>> newPassword(String newPassword);
}
