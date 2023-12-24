import 'package:data_sharing_organizing/core/utils/services/api_services.dart';

import '../../domain/entities/auth_user_entity.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();
  Future<AuthUserEntity> login(AuthUserEntity user);
  Future<AuthUserEntity> signUp(AuthUserEntity user);
  Future<AuthUserEntity> requestToRecoverAccount(String email);
  Future<AuthUserEntity> verifyCode(int code);
}

class AuthRemoteDataSourceImp extends AuthRemoteDataSource {
  final APIServices service;

  AuthRemoteDataSourceImp(this.service);

  @override
  Future<AuthUserEntity> login(AuthUserEntity user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<AuthUserEntity> requestToRecoverAccount(String email) {
    // TODO: implement requestToRecoverAccount
    throw UnimplementedError();
  }

  @override
  Future<AuthUserEntity> signUp(AuthUserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<AuthUserEntity> verifyCode(int code) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }
}
