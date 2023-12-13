import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/theme_fn.dart';
import 'package:flutter/material.dart';

abstract final class MyRadioThemeData {
  const MyRadioThemeData();
  static RadioThemeData light() {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => ThemeFunctions.activeColor(states, AppColor.active),
      ),
    );
  }

  static RadioThemeData dark() {
    return RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => ThemeFunctions.activeColor(states, AppColor.active),
      ),
    );
  }
}
