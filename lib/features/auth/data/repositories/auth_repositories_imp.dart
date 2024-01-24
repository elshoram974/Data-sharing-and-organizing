import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/excute_and_handle_remote_errors.dart';

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
  Future<Status<User>> login(LoginUserEntity user) async {
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
  Future<Status<User>> socialLogin(UserProvider provider) async {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.socialLogin(provider);
        await localDataSource.saveUser(authUser);

        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> requestToRecoverAccount(String email) {
    // TODO: implement requestToRecoverAccount
    throw UnimplementedError();
  }

  @override
  Future<Status<User>> signUp(AuthUserEntity user) async {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.signUp(user);
        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> requestToSendCode(int id) async {
    return executeAndHandleErrors<User>(
      () async {
        User authUser = await remoteDataSource.requestToSendCode(id);
        return authUser;
      },
    );
  }

  @override
  Future<Status<User>> verifyCode(({int id, int code}) param) {
    return executeAndHandleErrors<User>(
      () async {
        User user = await remoteDataSource.verifyCode(param.id, param.code);
        return user;
      },
    );
  }

  @override
  Status<bool> isLoggedIn() => Success(localDataSource.isLoggedIn());

  @override
  Future<Status<int>> logOut() async => Success(await localDataSource.logOut());

  @override
  Future<Status<User>> newPassword(String newPassword) {
    // TODO: implement newPassword
    throw UnimplementedError();
  }

  // @override
  // Future<
  //     ({
  //       Status status,
  //       List<HomeBooksEntity> data,
  //     })> fetchFeaturedBooks(int pageNumber) async {
  //   List<HomeBooksEntity> books =
  //       localDataSource.fetchFeaturedBooks(pageNumber);
  //   try {
  //     if (books.isNotEmpty) return (status: Success(), data: books);
  //     books = await remoteDataSource.fetchFeaturedBooks(pageNumber);
  //     return (status: Success(), data: books);
  //   } catch (e) {
  //     if (e is HttpException) {
  //       return (status: ServerFailure.fromHttpException(e), data: books);
  //     }
  //     return (status: Failure(e.toString()), data: books);
  //   }
  // }

  // @override
  // Future<
  //     ({
  //       Status status,
  //       List<HomeBooksEntity> data,
  //     })> fetchSuggestionBooks(int pageNumber) async {
  //   List<HomeBooksEntity> books = localDataSource.fetchSuggestionBooks(pageNumber);
  //   try {
  //     if (books.isNotEmpty) return (status: Success(), data: books);
  //     books = await remoteDataSource.fetchSuggestionBooks(pageNumber);
  //     return (status: Success(), data: books);
  //   } catch (e) {
  //     if (e is HttpException) {
  //       return (status: ServerFailure.fromHttpException(e), data: books);
  //     }
  //     return (status: Failure(e.toString()), data: books);
  //   }
  // }
}
