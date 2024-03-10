import 'package:data_sharing_organizing/core/utils/services/api_services.dart';
import 'package:get_it/get_it.dart';

import '../notification_services.dart';
import '../social_services.dart';
import 'cubit_dependency.dart';
import 'data_source_dependency.dart';
import 'repositories_dependency.dart';
import 'usecases_dependency.dart';

final GetIt sl = GetIt.instance;

void initDependencies() {
  // Dependency
  sl.registerSingleton<APIServices>(const APIServices());
  sl.registerSingleton<NotificationApi>(const NotificationApi());
  sl.registerLazySingleton<SocialServices>(() => const SocialServices());

  dataSourceDependency();

  repositoriesDependency();

  useCasesDependency();

  cubitDependency();
}
