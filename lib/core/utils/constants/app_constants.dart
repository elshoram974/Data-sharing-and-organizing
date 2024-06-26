import 'package:flutter/foundation.dart';

abstract final class AppConst {
  const AppConst();

  static const double borderRadius = 15;
  static const double defaultPadding = 16;

  static const double constraint = 600;
  static const double dialogConstraint = 400;

  static const int maxPhone = 500;
  static const int maxTablet = 900;

  static const bool isWeb = kIsWeb;

  static const Duration durationBeforeSearch = Duration(milliseconds: 800);
}
