import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/verification_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_data_sources.dart';
import '../datasources/auth_remote_data_sources.dart';
import '../models/app_user/user.dart';

class AuthRepositoriesImp extends AuthRepositories {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Status<User>> login(LoginUserEntity user) {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.login(user);
        if (user.keepLogin && authUser.userIsVerified) {
          await localDataSource.saveUser(user);
        }

        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> socialLogin(UserProvider provider) {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.socialLogin(provider);
        await localDataSource.saveUser(authUser);

        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> signUp(AuthUserEntity user) {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.signUp(user);
        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> requestToSendCode(
    ({String email, VerificationType verification}) param,
  ) {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.requestToSendCode(
          param.email,
          param.verification,
        );
        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> verifyCode(
      ({
        int id,
        String code,
        VerificationType verification,
      }) param) {
    return executeAndHandleErrors<User>(
      () async {
        User user = await remoteDataSource.verifyCode(
          param.id,
          param.code,
          param.verification,
        );
        return user;
      },
    );
  }

  @override
  Status<AuthUserEntity?> currentUser() => Success(localDataSource.getCurrentUser());

  @override
  Future<Status<int>> logOut() async => Success(await localDataSource.logOut());

  @override
  Future<Status<User>> newPassword(({int id, String newPass}) param) {
    return executeAndHandleErrors<User>(
      () async {
        User user = await remoteDataSource.newPassword(param.id, param.newPass);
        return user;
      },
    );
  }
}
