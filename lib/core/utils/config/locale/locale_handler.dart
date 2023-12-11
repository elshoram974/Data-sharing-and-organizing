import 'dart:ui';

import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency.dart';
import 'package:flutter/material.dart';

import '../../../../features/splash/presentation/cubit/config_cubit.dart';
import 'generated/l10n.dart';

final class AppLocale {
  static final PlatformDispatcher dispatcher = WidgetsBinding.instance.platformDispatcher;
   final Locale deviceLocale = dispatcher.locale;
   final List<Locale> systemLocales = dispatcher.locales;
  static Locale? localeResolutionCallback(Locale? locale, ConfigCubit cubit) {
  if (locale == null || pref.containsKey(AppStrings.locale)) return null;
  final Locale deviceLocale = AppLocale().deviceLocale;
  final bool isSupported = S.delegate.isSupported(deviceLocale);
  if (isSupported) {
    cubit.appLocale = deviceLocale;
    return deviceLocale;
  }
  return null;
}
}
