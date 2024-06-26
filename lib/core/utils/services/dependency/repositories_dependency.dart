import '../../../../features/auth/data/datasources/auth_local_data_sources.dart';
import '../../../../features/auth/data/datasources/auth_remote_data_sources.dart';
import '../../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../../../../features/chat/data/datasources/local_data_sources/bot_local_data_sources.dart';
import '../../../../features/chat/data/datasources/local_data_sources/group_details_local_data_sources.dart';
import '../../../../features/chat/data/datasources/local_data_sources/group_init_local_data_sources.dart';
import '../../../../features/chat/data/datasources/remote_data_sources/directories_remote_data_sources.dart';
import '../../../../features/chat/data/datasources/remote_data_sources/group_details_remote_data_sources.dart';
import '../../../../features/chat/data/repositories/bot_repo.dart';
import '../../../../features/chat/data/repositories/group_details_repo_imp.dart';
import '../../../../features/chat/data/repositories/init_group_repo.dart';
import '../../../../features/chat/domain/repositories/bot_repo.dart';
import '../../../../features/chat/domain/repositories/group_details_repo.dart';
import '../../../../features/chat/domain/repositories/init_group_repo.dart';
import '../../../../features/new_group/data/datasources/new_group_remote_data_source.dart';
import '../../../../features/new_group/data/repositories/new_group_repositories_imp.dart';
import '../../../../features/new_group/domain/repositories/new_group_repositories.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/notification_local_data_sources.dart';
import '../../../../features/user_home/data/repositories/edit_profile_repositories_imp.dart';
import '../../../../features/user_home/data/repositories/home_repositories_imp.dart';
import '../../../../features/user_home/data/repositories/notification_repositories_imp.dart';
import '../../../../features/user_home/domain/repositories/edit_profile_repositories.dart';
import '../../../../features/user_home/domain/repositories/home_repositories.dart';
import '../../../../features/user_home/domain/repositories/notification_repositories.dart';
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

  // notifications
  sl.registerSingleton<NotificationRepositories>(
    NotificationRepositoriesImp(sl.get<NotificationLocalDataSource>()),
  );
  // group
  sl.registerSingleton<GroupInitRepositories>(
    GroupInitRepositoriesImp(sl.get<GroupInitLocalDataSource>()),
  );
  sl.registerSingleton<BOTRepositories>(
    BOTRepositoriesImp(
      localDataSource: sl.get<BOTLocalDataSource>(),
      remoteDataSource: sl.get<DirectoriesRemoteDataSource>(),
    ),
  );
  sl.registerSingleton<GroupDetailsRepositories>(
    GroupDetailsRepositoriesImp(
      localDataSource: sl.get<GroupDetailsLocalDataSource>(),
      remoteDataSource: sl.get<GroupDetailsRemoteDataSource>(),
    ),
  );
  // new group
  sl.registerSingleton<NewGroupRepositories>(
    NewGroupRepositoriesImp(
      localDataSource: sl.get<HomeLocalDataSource>(),
      remoteDataSource: sl.get<NewGroupRemoteDataSource>(),
    ),
  );
}
