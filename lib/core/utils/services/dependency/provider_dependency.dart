import '../../../../features/auth/presentation/cubit/login_cubit/login_cubit.dart';

abstract final class ProviderDependency {
  const ProviderDependency();

  static late LoginCubit login;
}
