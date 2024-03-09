import '../../../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../../features/auth/domain/usecases/social_login_use_case.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import '../../../../features/user_home/domain/usecases/home_use_case/exit_from_some_groups.dart';
import '../../../../features/user_home/domain/usecases/home_use_case/get_groups.dart';
import '../../../../features/user_home/presentation/cubit/user_home_cubit/user_home_cubit.dart';
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

  // * home cubits
  sl.registerLazySingleton(
    () => UserHomeCubit(
      getGroupsUseCase: sl.get<GetGroupsUseCase>(),
      exitFromSomeGroups: sl.get<ExitFromSomeGroups>(),
    ),
  );
}
