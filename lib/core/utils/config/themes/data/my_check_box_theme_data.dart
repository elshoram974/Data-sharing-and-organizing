import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/theme_fn.dart';
import 'package:flutter/material.dart';

abstract final class MyCheckboxThemeData {
  const MyCheckboxThemeData();
  static CheckboxThemeData light() {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => ThemeFunctions.activeColor(states, AppColor.active),
      ),
    );
  }

  static CheckboxThemeData dark() {
    return CheckboxThemeData(
      checkColor: const MaterialStatePropertyAll(Colors.white60),
      fillColor: MaterialStateProperty.resolveWith<Color?>(
        (states) => ThemeFunctions.activeColor(states, AppColor.active),
      ),
    );
  }
}
