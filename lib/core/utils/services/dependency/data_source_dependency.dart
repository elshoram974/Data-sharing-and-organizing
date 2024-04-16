import '../../../../features/auth/data/datasources/auth_local_data_sources.dart';
import '../../../../features/auth/data/datasources/auth_remote_data_sources.dart';
import '../../../../features/chat/data/datasources/local_data_sources/directories_local_data_sources.dart';
import '../../../../features/chat/data/datasources/local_data_sources/group_init_local_data_sources.dart';
import '../../../../features/chat/data/datasources/remote_data_sources/directories_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/edit_profile_datasources/edit_profile_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_remote_data_sources.dart';
import '../api_services.dart';
import 'locator.dart';

void dataSourceDependency() {
  // authentication
  sl.registerSingleton<AuthLocalDataSourceImp>(AuthLocalDataSourceImp());
  sl.registerSingleton<AuthRemoteDataSourceImp>(
    AuthRemoteDataSourceImp(sl.get<APIServices>()),
  );

  // home
  sl.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImp());
  sl.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImp(sl.get<APIServices>()),
  );

  // edit profile
  sl.registerSingleton<EditProfileLocalDataSource>(
      EditProfileLocalDataSourceImp());
  sl.registerSingleton<EditProfileRemoteDataSource>(
    EditProfileRemoteDataSourceImp(sl.get<APIServices>()),
  );

  // group
  sl.registerSingleton<GroupInitLocalDataSource>(const GroupInitLocalDataSourceImp());
  sl.registerSingleton<DirectoriesLocalDataSource>(DirectoriesLocalDataSourceImp(sl.get<HomeLocalDataSource>()));
  sl.registerSingleton<DirectoriesRemoteDataSource>(DirectoriesRemoteDataSourceImp(sl.get<APIServices>()));
}
