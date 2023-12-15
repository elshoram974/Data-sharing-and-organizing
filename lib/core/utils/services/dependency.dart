import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:data_sharing_organizing/features/auth/data/datasources/auth_local_data_sources.dart';
import 'package:data_sharing_organizing/features/auth/data/datasources/auth_remote_data_sources.dart';
import 'package:data_sharing_organizing/features/auth/data/repositories/auth_repositories_imp.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../features/auth/domain/usecases/is_logged_in_use_case.dart';

final GetIt getIt = GetIt.instance;

void getItSingleton() {
  getIt.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(
      AuthRepositoriesImp(
        localDataSource: AuthLocalDataSourceImp(),
        remoteDataSource: AuthRemoteDataSourceImp(APIServices(Dio())),
      ),
    ),
  );
  // getIt.registerSingleton<>(
  // );
}
