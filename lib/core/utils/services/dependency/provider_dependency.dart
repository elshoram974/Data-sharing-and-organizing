import 'package:data_sharing_organizing/features/auth/presentation/cubit/auth_cubit.dart';

abstract final class ProviderDependency {
  const ProviderDependency();

  static late AuthCubit auth;
}
