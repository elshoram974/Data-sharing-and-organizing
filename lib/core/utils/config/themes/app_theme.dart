import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import 'data/my_check_box_theme_data.dart';
import 'data/my_list_tile_theme_data.dart';
import 'data/my_switch_theme_data.dart';

class AppTheme {
  static ThemeData lightMode = ThemeData(
    useMaterial3: true,
    fontFamily: AppStrings.inter,
    checkboxTheme: MyCheckboxThemeData.light(),
    switchTheme: MySwitchThemeData.light(),
    listTileTheme: MyListTileThemeData.light(),
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
    checkboxTheme: MyCheckboxThemeData.dark(),
    switchTheme: MySwitchThemeData.dark(),
    listTileTheme: MyListTileThemeData.dark(),
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
}
