import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:get_it/get_it.dart';

import '../../../../features/auth/data/datasources/auth_local_data_sources.dart';
import '../../../../features/auth/data/datasources/auth_remote_data_sources.dart';
import '../../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../notification_services.dart';
import 'cubit_dependency.dart';
import 'data_source_dependency.dart';
import 'usecases_dependency.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {

  // Dependency
  sl.registerSingleton<APIServices>(const APIServices());
  sl.registerSingleton<NotificationApi>(const NotificationApi());

  dataSourceDependency();

  sl.registerSingleton<AuthRepositoriesImp>(
    AuthRepositoriesImp(
      localDataSource: sl.get<AuthLocalDataSourceImp>(),
      remoteDataSource: sl.get<AuthRemoteDataSourceImp>(),
    ),
  );

  useCasesDependency();

  cubitDependency();
}
