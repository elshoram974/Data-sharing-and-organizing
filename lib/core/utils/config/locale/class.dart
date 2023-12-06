import 'package:flutter/material.dart';

import 'locale_handler.dart';

class LocaleClass {
  final Locale locale;
  final String languageName;
  late final bool isDeviceLang;
  LocaleClass({required this.locale, required this.languageName}) {
    isDeviceLang = locale.languageCode == AppLocale().deviceLocale.languageCode;
  }

  static LocaleClass? get systemLocale {
    final Locale deviceLocale = AppLocale().deviceLocale;

    for (LocaleClass e in locales) {
      if (e.locale.languageCode == deviceLocale.languageCode) return e;
    }

    return null;
  }

  factory LocaleClass.fromCurrent(Locale locale) {
    for (LocaleClass e in locales) {
      if (e.locale.languageCode == locale.languageCode) return e;
    }

    return locales.first;
  }

  static List<LocaleClass> get locales => [
        LocaleClass(locale: const Locale('en'), languageName: 'English'),
        LocaleClass(locale: const Locale('ar'), languageName: 'عربي'),
      ];
}
