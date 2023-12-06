import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:flutter/material.dart';

abstract class AppColor {
  const AppColor();

  static const int _primaryInt = 0xFFF5576C;
  static const Color primary = Color(_primaryInt);

  static const int _activeLightInt = 0xFFFF0022;
  static const Color activeLight = Color(_activeLightInt);
  static const int _activeDarkInt = 0xFFC3001A;
  static const Color activeDark = Color(_activeDarkInt);

  static Color active(BuildContext context) =>
      context.isDarkMode ? activeDark : activeLight;
}
