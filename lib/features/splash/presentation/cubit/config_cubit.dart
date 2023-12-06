import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(const ConfigInitial());

  ThemeMode themeMode =
      ThemeMode.values[pref.getInt(AppStrings.themeMode) ?? 0];

  Locale appLocale = pref.containsKey(AppStrings.locale)
      ? Locale(pref.getString(AppStrings.locale)!)
      : AppLocale().deviceLocale;

  void changeMode(ThemeMode mode) {
    themeMode = mode;
    pref.setInt(AppStrings.themeMode, mode.index);
    emit(ChangeThemeMode(mode));
  }

  void changeLocale(String lang) {
    appLocale = Locale(lang);
    pref.setString(AppStrings.locale, lang);
    emit(ChangeLanguage(lang));
  }

  bool get appIsDark =>
      themeMode == ThemeMode.dark ||
      (themeMode == ThemeMode.system && AppTheme.isDarkMode());
}
