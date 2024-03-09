import '../../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../../../../features/auth/domain/usecases/get_current_user_use_case.dart';
import '../../../../features/auth/domain/usecases/log_out_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../../features/auth/domain/usecases/new_password_use_case.dart';
import '../../../../features/auth/domain/usecases/request_to_send_code_use_case.dart';
import '../../../../features/auth/domain/usecases/sign_up_use_case.dart';
import '../../../../features/auth/domain/usecases/social_login_use_case.dart';
import '../../../../features/auth/domain/usecases/verify_code_use_case.dart';
import '../../../../features/user_home/domain/repositories/home_repositories.dart';
import '../../../../features/user_home/domain/usecases/home_use_case/exit_from_some_groups.dart';
import '../../../../features/user_home/domain/usecases/home_use_case/get_groups.dart';
import '../../../../features/user_home/domain/usecases/home_use_case/mark_as_un_read.dart';
import 'locator.dart';

void useCasesDependency() {
  sl.registerSingleton<GetCurrentUserUseCase>(
    GetCurrentUserUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<SocialLoginUseCase>(
    () => SocialLoginUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<RequestToSendCodeUseCase>(
    () => RequestToSendCodeUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<VerifyCodeUseCase>(
    () => VerifyCodeUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<NewPasswordUseCase>(
    () => NewPasswordUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(sl.get<AuthRepositoriesImp>()),
  );

  sl.registerLazySingleton<GetGroupsUseCase>(
    () => GetGroupsUseCase(sl.get<HomeRepositories>()),
  );
  sl.registerLazySingleton<ExitFromSomeGroups>(
    () => ExitFromSomeGroups(sl.get<HomeRepositories>()),
  );
  sl.registerLazySingleton<MarkAsUnRead>(
    () => MarkAsUnRead(sl.get<HomeRepositories>()),
  );
}
