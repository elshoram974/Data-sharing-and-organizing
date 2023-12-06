import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter/material.dart';

import 'constants/app_color.dart';

abstract final class AppStyle {
  const AppStyle();
  // static const TextStyle styleMedium14 = TextStyle(
  //   fontSize: 14,
  //   fontWeight: FontWeight.w500,
  //   fontFamily: AppStrings.montserrat,
  // );
  // static const TextStyle styleBold15 = TextStyle(
  //   fontSize: 15,
  //   fontWeight: FontWeight.bold,
  //   fontFamily: AppStrings.montserrat,
  // );
  static const TextStyle styleBoldInika24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    fontFamily: AppStrings.inika,
  );
  static const TextStyle styleRegular15 = TextStyle(
    fontSize: 15,
    color: AppColor.gray,
    fontWeight: FontWeight.normal,
  );
  static const TextStyle styleBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle styleRegular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.normal,
  );
  // static const TextStyle styleSemiBold18 = TextStyle(
  //   fontSize: 18,
  //   fontWeight: FontWeight.w600,
  // );
  // static const TextStyle styleRegular20 = TextStyle(
  //   fontSize: 20,
  //   fontFamily: AppStrings.sectra,
  // );
}
