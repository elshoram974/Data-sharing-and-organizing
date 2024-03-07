import '../../../../features/auth/data/datasources/auth_local_data_sources.dart';
import '../../../../features/auth/data/datasources/auth_remote_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_local_data_sources.dart';
import '../../../../features/user_home/data/datasources/home_datasources/home_remote_data_sources.dart';
import '../api_services.dart';
import 'locator.dart';

void dataSourceDependency() {
  sl.registerSingleton<AuthLocalDataSourceImp>(AuthLocalDataSourceImp());
  sl.registerSingleton<AuthRemoteDataSourceImp>(
    AuthRemoteDataSourceImp(sl.get<APIServices>()),
  );
  
  sl.registerSingleton<HomeLocalDataSource>(HomeLocalDataSourceImp());
  sl.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImp(sl.get<APIServices>()),
  );
}
