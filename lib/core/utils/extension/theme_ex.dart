import 'package:flutter/material.dart';

extension ThemeEx on BuildContext {
  bool get isDarkMode {
    final Brightness brightness = MediaQuery.platformBrightnessOf(this);
    return brightness == Brightness.dark;
  }
}
