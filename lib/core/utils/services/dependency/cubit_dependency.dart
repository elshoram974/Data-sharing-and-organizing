import '../../../../features/auth/domain/usecases/is_logged_in_use_case.dart';
// import '../../../../features/auth/domain/usecases/log_out_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
// import '../../../../features/auth/domain/usecases/recover_account_use_case.dart';
// import '../../../../features/auth/domain/usecases/sign_up_use_case.dart';
// import '../../../../features/auth/domain/usecases/verify_code_use_case.dart';
// import '../../../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import 'locator.dart';

void cubitDependency() {
  sl.registerSingleton(ConfigCubit(sl.get<IsLoggedInUseCase>()));
  // sl.registerLazySingleton(
  //   () => AuthCubit(
  //     logOutUseCase: sl.get<LogOutUseCase>(),
  //     loginUseCase: sl.get<LoginUseCase>(),
  //     signUpUseCase: sl.get<SignUpUseCase>(),
  //     verifyCodeUseCase: sl.get<VerifyCodeUseCase>(),
  //     recoverAccountUseCase: sl.get<RequestToRecoverAccountUseCase>(),
  //   ),
  // );
  sl.registerLazySingleton(() => LoginCubit(sl.get<LoginUseCase>()));
}
