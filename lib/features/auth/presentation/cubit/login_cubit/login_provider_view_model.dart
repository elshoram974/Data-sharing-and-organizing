import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';

final class LoginProvidersViewModel {
  final String assetName;
  final void Function()? onTap;

  LoginProvidersViewModel({required this.assetName, required this.onTap});

  static List<LoginProvidersViewModel> providers = [
    LoginProvidersViewModel(
      assetName: AppAssets.facebookLogo,
      onTap: () => ProviderDependency.login.socialLogin(UserProvider.facebook),
    ),
    LoginProvidersViewModel(
      assetName: AppAssets.googleLogo,
      onTap: () => ProviderDependency.login.socialLogin(UserProvider.google),
    ),
  ];
}
