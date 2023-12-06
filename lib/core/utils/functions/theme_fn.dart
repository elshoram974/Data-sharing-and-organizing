import 'package:flutter/material.dart';

abstract final class ThemeFunctions {
  const ThemeFunctions();
  static Color? activeColor(Set<MaterialState> states, Color activeColor) {
    return color(states, activeColor, null);
  }

  static Color? color(
    Set<MaterialState> states,
    Color? selectedColor,
    Color? unSelectedColor,
  ) {
    if (states.contains(MaterialState.selected)) {
      return selectedColor;
    }
    return unSelectedColor;
  }
}