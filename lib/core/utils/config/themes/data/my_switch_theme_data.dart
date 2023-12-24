import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/functions/theme_fn.dart';
import 'package:flutter/material.dart';

abstract final class MySwitchThemeData {
  const MySwitchThemeData();
  static SwitchThemeData light() {
    return SwitchThemeData(
      trackOutlineWidth: const MaterialStatePropertyAll(0),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (states) => ThemeFunctions.color(states, null, AppColor.secondary)),
      thumbColor: MaterialStateProperty.resolveWith<Color?>((states) =>
          ThemeFunctions.color(states, AppColor.active, Colors.white)),
      thumbIcon: const MaterialStatePropertyAll(
        Icon(
          Icons.circle_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  static SwitchThemeData dark() {
    return SwitchThemeData(
      trackOutlineWidth: const MaterialStatePropertyAll(0),
      trackColor: MaterialStateProperty.resolveWith<Color?>(
          (states) => ThemeFunctions.color(states, AppColor.active, null)),
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
          (states) => ThemeFunctions.color(states, Colors.white, null)),
      thumbIcon: const MaterialStatePropertyAll(
        Icon(
          Icons.circle_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }
}
