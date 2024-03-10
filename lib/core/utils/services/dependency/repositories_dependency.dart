import '../../../../features/auth/data/datasources/auth_local_data_sources.dart';
import '../../../../features/auth/data/datasources/auth_remote_data_sources.dart';
import '../../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_remote_data_sources.dart';
import '../../../../features/user_home/data/repositories/edit_profile_repositories_imp.dart';
import '../../../../features/user_home/data/repositories/home_repositories_imp.dart';
import '../../../../features/user_home/domain/repositories/edit_profile_repositories.dart';
import '../../../../features/user_home/domain/repositories/home_repositories.dart';
import 'locator.dart';

void repositoriesDependency() {
  // authentication
  sl.registerSingleton<AuthRepositoriesImp>(
    AuthRepositoriesImp(
      localDataSource: sl.get<AuthLocalDataSourceImp>(),
      remoteDataSource: sl.get<AuthRemoteDataSourceImp>(),
    ),
  );

  // home
  sl.registerSingleton<HomeRepositories>(
    HomeRepositoriesImp(
      localDataSource: sl.get<HomeLocalDataSource>(),
      remoteDataSource: sl.get<HomeRemoteDataSource>(),
    ),
  );

  // edit profile
  sl.registerSingleton<EditProfileRepositories>(
    EditProfileRepositoriesImp(
      localDataSource: sl.get<EditProfileLocalDataSource>(),
      remoteDataSource: sl.get<EditProfileRemoteDataSource>(),
    ),
  );
}
