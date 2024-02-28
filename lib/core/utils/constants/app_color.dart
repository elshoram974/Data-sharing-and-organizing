import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../features/splash/presentation/cubit/config_cubit.dart';

abstract final class AppColor {
  const AppColor();
  static final ConfigCubit cubit = ProviderDependency.config;

  static const int _primaryInt = 0xFFF5576C;
  static const Color primary = Color(_primaryInt);

  static const int _secondaryInt = 0xFFD9D9D9;
  static const Color secondary = Color(_secondaryInt);

  static const int _grayInt = 0xFF949494;
  static const Color gray = Color(_grayInt);

  static const int _activeInt = 0xFFE87282;
  static const Color active = Color(_activeInt);

  static const Color _selectedLight = secondary;
  static const Color _selectedDark = Color(0xFF616161);
  static Color get selected => cubit.appIsDark ? _selectedDark : _selectedLight;

  // static const int _activeLightInt = 0xFFFF0022;
  // static const Color activeLight = Color(_activeLightInt);
  // static const int _activeDarkInt = 0xFFC3001A;
  // static const Color activeDark = Color(_activeDarkInt);

  // static Color active(BuildContext context) =>
  //     context.isDarkMode ? activeDark : activeLight;
}
