import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/social_services.dart';
import 'package:data_sharing_organizing/features/auth/data/models/app_user/app_user.dart';

import '../../domain/entities/auth_user_entity.dart';
import '../models/app_user/user.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> login(AuthUserEntity user);
  Future<User> socialLogin(UserProvider provider);
  Future<User> signUp(AuthUserEntity user);
  Future<User> requestToSendCode(String email, VerificationType verification);
  Future<User> verifyCode(int id, String code, VerificationType verification);
  Future<User> newPassword(int id, String newPass);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final APIServices service;

  AuthRemoteDataSourceImp(this.service);

  @override
  Future<User> login(AuthUserEntity user) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.login,
      {'email': user.email, 'password': user.password},
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> socialLogin(UserProvider provider) async {
    late final AuthUserEntity? user;
    if (provider == UserProvider.facebook) {
      user = await sl.get<SocialServices>().signInWithFacebook();
    } else {
      user = await sl.get<SocialServices>().signInWithGoogle();
    }
    if (user == null) throw S.current.processHasBeenCancelled;
    Map<String, dynamic> response = await service.post(
      AppLinks.loginByProvider,
      {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'provider': provider.inString,
      },
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> signUp(AuthUserEntity user) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.signUp,
      {
        'name': user.name,
        'email': user.email,
        'password': user.password,
        'userRole': user.userRole.inString,
      },
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> requestToSendCode(
      String email, VerificationType verification) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.sendVerifyCode,
      {'email': email, 'verificationType': verification.inString},
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> verifyCode(
    int id,
    String code,
    VerificationType verification,
  ) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.checkVerifyCode,
      {
        'userId': '$id',
        'code': code,
        'verificationType': verification.inString,
      },
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> newPassword(int id, String newPass) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.newPassword,
      {'userId': '$id', 'newPassword': newPass},
    );
    return AppUser.fromMap(response).user!;
  }
}
