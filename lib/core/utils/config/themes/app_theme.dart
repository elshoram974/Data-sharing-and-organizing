import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: AppStrings.inter,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => _activeColor(states, AppColor.activeLight),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.light,
    ),
    // textTheme: TextTheme(titleLarge: AppStyle.styleRegular24),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      elevation: 0,
    ),
  );
  static ThemeData darkMode = ThemeData(
    useMaterial3: true,
    checkboxTheme: CheckboxThemeData(
      checkColor: const MaterialStatePropertyAll(Colors.white60),
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => _activeColor(states, AppColor.activeDark),
      ),
    ),
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
    ),
    fontFamily: AppStrings.inter,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
    ),
    scaffoldBackgroundColor: const Color(0xFF373737),
  );

  static bool isDarkMode() {
    final SchedulerBinding s = SchedulerBinding.instance;
    final Brightness brightness = s.platformDispatcher.platformBrightness;
    return brightness == Brightness.dark;
  }

  static Color? _activeColor(Set<MaterialState> states, Color activeColor) {
    if (states.contains(MaterialState.selected)) {
      return activeColor;
    }
    return null;
  }
}

extension ThemeEx on BuildContext {
  bool get isDarkMode {
    final Brightness brightness = MediaQuery.platformBrightnessOf(this);
    return brightness == Brightness.dark;
  }
}
