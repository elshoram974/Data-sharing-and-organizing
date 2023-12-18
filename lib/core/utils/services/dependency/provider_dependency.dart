import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';
import '../../../../features/auth/presentation/cubit/sign_up_cubit/sign_up_cubit.dart';

abstract final class ProviderDependency {
  const ProviderDependency();

  // * Authentication Cubits
  static late LoginCubit login;
  static late SignUpCubit signUp;
}
