import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';

import '../../data/models/app_user/user.dart';
import '../entities/auth_user_entity.dart';
import '../entities/login_entity.dart';

abstract class AuthRepositories {
  Future<Status<User>> login(LoginUserEntity user);
  Future<Status<User>> socialLogin(UserProvider provider);
  Status<AuthUserEntity?> currentUser();
  Future<Status<void>> logOut();
  Future<Status<User>> signUp(AuthUserEntity user);
  Future<Status<User>> requestToSendCode(({String email, VerificationType verification}) param);
  Future<Status<User>> verifyCode(({int id , String code, VerificationType verification}) param);
  Future<Status<User>> newPassword(({int id , String newPass}) param);
}
