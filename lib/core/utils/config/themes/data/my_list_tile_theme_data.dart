import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

abstract final class MyListTileThemeData {
  const MyListTileThemeData();
  static ListTileThemeData light() {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
    );
  }

  static ListTileThemeData dark() {
    return ListTileThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
    );
  }
}
