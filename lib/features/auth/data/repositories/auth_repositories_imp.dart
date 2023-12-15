import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../../domain/repositories/auth_repositories.dart';
import '../datasources/auth_local_data_sources.dart';
import '../datasources/auth_remote_data_sources.dart';

class AuthRepositoriesImp extends AuthRepositories {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Status<AuthUserEntity>> login(AuthUserEntity user) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Status<AuthUserEntity>> requestToRecoverAccount(String email) {
    // TODO: implement requestToRecoverAccount
    throw UnimplementedError();
  }

  @override
  Future<Status<AuthUserEntity>> signUp(AuthUserEntity user) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  Future<Status<AuthUserEntity>> verifyCode(int code) {
    // TODO: implement verifyCode
    throw UnimplementedError();
  }

  @override
  Status<bool> isLoggedIn() => Success(localDataSource.isLoggedIn());

  @override
  Future<Status<int>> logOut() async => Success(await localDataSource.logOut());

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
  //     if (e is DioException) {
  //       return (status: ServerFailure.fromDioException(e), data: books);
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
  //     if (e is DioException) {
  //       return (status: ServerFailure.fromDioException(e), data: books);
  //     }
  //     return (status: Failure(e.toString()), data: books);
  //   }
  // }
}
