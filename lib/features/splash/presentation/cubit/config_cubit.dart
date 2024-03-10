import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/locale_handler.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/init_local.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import '../../../auth/domain/usecases/get_current_user_use_case.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  final GetCurrentUserUseCase getCurrentUserUseCase;

  ConfigCubit(this.getCurrentUserUseCase) : super(const ConfigInitial());

  // * ThemeMode ----------------------------------------------
  ThemeMode themeMode =
      ThemeMode.values[int.parse(config.get(AppStrings.themeMode) ?? '0')];

  void changeMode(ThemeMode mode) async {
    themeMode = mode;
    await config.put(AppStrings.themeMode, '${mode.index}');
    emit(ChangeThemeMode(mode));
  }

  //  end mode ----------------------------------------------

  // * Locale ----------------------------------------------
  Locale appLocale = config.containsKey(AppStrings.locale)
      ? Locale(config.get(AppStrings.locale)!)
      : AppLocale().deviceLocale;

  void changeLocale(String lang) async {
    appLocale = Locale(lang);
    await config.put(AppStrings.locale, lang);
    emit(ChangeLanguage(lang));
  }
  //  end locale ----------------------------------------------

  // * font scale factor ----------------------------------------------
  late double textScaler = config.containsKey(AppStrings.fontScale)
      ? double.parse(config.get(AppStrings.fontScale) as String)
      : 1;
  final List<double> scales = [0.8, 1, 1.2, 1.5];
  void changeFontScale(double val) async {
    await config.put(AppStrings.fontScale, "$val");

    textScaler = scales.reduce(
      (p, c) => (val - p).abs() < (val - c).abs() ? p : c,
    );
    emit(ChangeFontScale(textScaler));
  }
  //  end font scale factor ----------------------------------------------

  bool get isLoggedIn => currentUser != null;
  bool get isArabic => appLocale.languageCode == 'ar';

  AuthUserEntity? get currentUser {
    Status<AuthUserEntity?> status = getCurrentUserUseCase();
    if (status is Success<AuthUserEntity?>) return status.data;
    return null;
  }
}
