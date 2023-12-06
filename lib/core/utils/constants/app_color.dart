import 'package:flutter/material.dart';

abstract class AppColor {
  const AppColor();

  static const int _primaryInt = 0xFFF5576C;
  static const Color primary = Color(_primaryInt);
  
  static const int _secondaryInt = 0xFFD9D9D9;
  static const Color secondary = Color(_secondaryInt);

  static const int _activeInt = 0xFFE87282;
  static const Color active = Color(_activeInt);
  // static const int _activeLightInt = 0xFFFF0022;
  // static const Color activeLight = Color(_activeLightInt);
  // static const int _activeDarkInt = 0xFFC3001A;
  // static const Color activeDark = Color(_activeDarkInt);

  // static Color active(BuildContext context) =>
  //     context.isDarkMode ? activeDark : activeLight;
}
