import 'package:data_sharing_organizing/core/utils/constants/app_assets.dart';

final class LoginProvidersViewModel {
  final String assetName;
  final void Function()? onTap;

  LoginProvidersViewModel({required this.assetName, required this.onTap});
  

  static List<LoginProvidersViewModel> providers = [
    LoginProvidersViewModel(assetName: AppAssets.facebookLogo, onTap: () {}),
    LoginProvidersViewModel(assetName: AppAssets.googleLogo, onTap: () {}),
  ];
}