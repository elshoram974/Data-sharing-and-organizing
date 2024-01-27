import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_provider_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';

final class LoginProvidersViewModel {
  final String assetName;
  final double padding;
  final void Function()? onTap;

  LoginProvidersViewModel({
    required this.assetName,
    required this.padding,
    required this.onTap,
  });

  static List<LoginProvidersViewModel> providers = [
    LoginProvidersViewModel(
      assetName: AppAssets.facebookLogo,
      padding: 2,
      onTap: () => ProviderDependency.login.socialLogin(UserProvider.facebook),
    ),
    LoginProvidersViewModel(
      assetName: AppAssets.googleLogo,
      padding: 5,
      onTap: () => ProviderDependency.login.socialLogin(UserProvider.google),
    ),
  ];
}
