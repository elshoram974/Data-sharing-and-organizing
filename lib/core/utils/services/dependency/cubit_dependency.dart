import '../../../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../../features/auth/domain/usecases/social_login_use_case.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import 'locator.dart';

void cubitDependency() {
  sl.registerSingleton(ConfigCubit(sl.get<GetCurrentUserUseCase>()));

  // * Authentication cubits
  sl.registerLazySingleton(
    () => LoginCubit(
      loginUseCase: sl.get<LoginUseCase>(),
      socialLoginUseCase: sl.get<SocialLoginUseCase>(),
    ),
  );
}
