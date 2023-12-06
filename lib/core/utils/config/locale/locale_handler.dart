import 'dart:ui';

import 'package:flutter/material.dart';

final class AppLocale {
  static final PlatformDispatcher dispatcher = WidgetsBinding.instance.platformDispatcher;
   final Locale deviceLocale = dispatcher.locale;
   final List<Locale> systemLocales = dispatcher.locales;
}
