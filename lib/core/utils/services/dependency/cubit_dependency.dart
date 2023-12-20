import '../../../../features/auth/domain/usecases/is_logged_in_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import 'locator.dart';

void cubitDependency() {
  sl.registerSingleton(ConfigCubit(sl.get<IsLoggedInUseCase>()));

  // * Authentication cubits
  sl.registerLazySingleton(() => LoginCubit(sl.get<LoginUseCase>()));
}
