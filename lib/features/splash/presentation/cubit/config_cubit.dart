import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/config/themes/app_theme.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/usecases/is_logged_in_use_case.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final IsLoggedInUseCase isLoggedInUseCase;

  ConfigCubit(this.isLoggedInUseCase) : super(const ConfigInitial());

  ThemeMode themeMode =
      ThemeMode.values[int.parse(config.get(AppStrings.themeMode) ?? '0')];

  Locale appLocale = config.containsKey(AppStrings.locale)
      ? Locale(config.get(AppStrings.locale)!)
      : AppLocale().deviceLocale;

  void changeMode(ThemeMode mode) async {
    themeMode = mode;
    await config.put(AppStrings.themeMode, '${mode.index}');
    emit(ChangeThemeMode(mode));
  }

  void changeLocale(String lang) async {
    appLocale = Locale(lang);
    await config.put(AppStrings.locale, lang);
    emit(ChangeLanguage(lang));
  }

  bool get appIsDark =>
      themeMode == ThemeMode.dark ||
      (themeMode == ThemeMode.system && AppTheme.isDarkMode());

  bool get isLoggedIn {
    final Status<bool> isLoggedInStatus = isLoggedInUseCase();
    if (isLoggedInStatus is Success<bool>) {
      return isLoggedInStatus.data;
    }
    return false;
  }
}
