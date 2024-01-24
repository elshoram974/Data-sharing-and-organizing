import '../../../../features/auth/data/repositories/auth_repositories_imp.dart';
import '../../../../features/auth/domain/usecases/is_logged_in_use_case.dart';
import '../../../../features/auth/domain/usecases/log_out_use_case.dart';
import '../../../../features/auth/domain/usecases/login_use_case.dart';
import '../../../../features/auth/domain/usecases/recover_account_use_case.dart';
import '../../../../features/auth/domain/usecases/request_to_send_code_use_case.dart';
import '../../../../features/auth/domain/usecases/sign_up_use_case.dart';
import '../../../../features/auth/domain/usecases/social_login_use_case.dart';
import '../../../../features/auth/domain/usecases/verify_code_use_case.dart';
import 'locator.dart';

void useCasesDependency() {
  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase(sl.get<AuthRepositoriesImp>()),
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
  sl.registerLazySingleton<RequestToRecoverAccountUseCase>(
    () => RequestToRecoverAccountUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<RequestToSendCodeUseCase>(
    () => RequestToSendCodeUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<VerifyCodeUseCase>(
    () => VerifyCodeUseCase(sl.get<AuthRepositoriesImp>()),
  );
  sl.registerLazySingleton<LogOutUseCase>(
    () => LogOutUseCase(sl.get<AuthRepositoriesImp>()),
  );
}
