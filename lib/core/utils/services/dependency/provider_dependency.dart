import '../../../../features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/auth/presentation/cubit/recoverAccount_cubit/recover_account_cubit.dart';
import '../../../../features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../features/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';

abstract final class ProviderDependency {
  const ProviderDependency();

  // * Authentication Cubits
  static late LoginCubit login;
  static late SignUpCubit signUp;
  static late VerifyCodeCubit verificationCode;
  static late RecoverAccountCubit  recoverAccount;
  static late CreateNewPasswordCubit  createNewPassword;
}
