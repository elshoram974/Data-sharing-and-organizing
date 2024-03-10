import 'package:flutter/material.dart';

import '../services/dependency/provider_dependency.dart';

extension ThemeEx on BuildContext {
  bool get isDarkMode {
    final Brightness brightness = MediaQuery.platformBrightnessOf(this);
    final ThemeMode themeMode = ProviderDependency.config.themeMode;
    return (brightness == Brightness.dark && themeMode == ThemeMode.system) || themeMode == ThemeMode.dark;
  }
}
