import 'package:data_sharing_organizing/core/utils/constants/app_links.dart';
import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/features/auth/data/models/app_user/app_user.dart';

import '../../domain/entities/auth_user_entity.dart';
import '../models/app_user/user.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<User> login(AuthUserEntity user);
  Future<User> signUp(AuthUserEntity user);
  Future<User> requestToRecoverAccount(String email);
  Future<User> requestToSendCode(int id);
  Future<User> verifyCode(int id, int code);
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
  Future<User> requestToRecoverAccount(String email) {
    // TODO: implement requestToRecoverAccount
    throw UnimplementedError();
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
  Future<User> requestToSendCode(int id) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.requestToSendCode,
      {'user_id': '$id'},
    );
    return AppUser.fromMap(response).user!;
  }

  @override
  Future<User> verifyCode(int id, int code) async {
    Map<String, dynamic> response = await service.post(
      AppLinks.requestToSendCode,
      {'user_id': '$id', 'code': '$code'},
    );
    return AppUser.fromMap(response).user!;
  }
}
