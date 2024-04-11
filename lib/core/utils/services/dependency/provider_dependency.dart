import '../../../../features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/auth/presentation/cubit/recoverAccount_cubit/recover_account_cubit.dart';
import '../../../../features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';
import '../../../../features/auth/presentation/cubit/verify_code_cubit/verify_code_cubit.dart';
import '../../../../features/chat/presentation/cubit/group_cubit/group_cubit.dart';
import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import '../../../../features/user_home/presentation/cubit/main_cubit/user_main_cubit.dart';
import '../../../../features/user_home/presentation/cubit/user_home_cubit/user_home_cubit.dart';
import '../../../../features/user_home/presentation/cubit/user_notification_cubit/user_notification_cubit.dart';

abstract class ProviderDependency {
  const ProviderDependency();

  // * Config Cubits
  static late ConfigCubit config;

  // * Authentication Cubits
  static late LoginCubit login;
  static late SignUpCubit signUp;
  static late VerifyCodeCubit verificationCode;
  static late RecoverAccountCubit recoverAccount;
  static late CreateNewPasswordCubit createNewPassword;

  // * User Home Cubits
  static late UserMainCubit userMain;
  static late UserHomeCubit userHome;
  static late UserNotificationCubit userNotification;
  
  // * Group Cubits
  static late GroupCubit group;
}
