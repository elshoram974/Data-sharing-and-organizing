import 'package:data_sharing_organizing/core/utils/extension/theme_ex.dart';
import 'package:flutter/material.dart';

abstract final class AppColor {
  const AppColor();
  static const int _primaryInt = 0xFFF5576C;
  static const Color primary = Color(_primaryInt);

  static const int _secondaryInt = 0xFFD9D9D9;
  static const Color secondary = Color(_secondaryInt);

  static const int _grayInt = 0xFF949494;
  static const Color gray = Color(_grayInt);
  static const Color grayLight = Color(0xffc8c8c8);

  static const int _activeInt = 0xFFE87282;
  static const Color active = Color(_activeInt);

  static const Color _selectedLight = secondary;
  static const Color _selectedDark = Color(0xFF616161);

  static Color selected(BuildContext _) =>
      _.isDarkMode ? _selectedDark : _selectedLight;
  static Color grayLightDark(BuildContext _) => _.isDarkMode ? gray : grayLight;

  static const Color _backgroundLight = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFF373737);
  static Color background(BuildContext _) =>
      _.isDarkMode ? backgroundDark : _backgroundLight;

  // static const int _activeLightInt = 0xFFFF0022;
  // static const Color activeLight = Color(_activeLightInt);
  // static const int _activeDarkInt = 0xFFC3001A;
  // static const Color activeDark = Color(_activeDarkInt);

  // static Color active(BuildContext context) =>
  //     context.isDarkMode ? activeDark : activeLight;
}
