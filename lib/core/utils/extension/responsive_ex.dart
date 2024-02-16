import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../enums/device_type.dart';

extension ResponsiveEX on BuildContext {
  bool get isPhoneWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width <= AppConst.maxPhone && width > 0;
  }

  bool get isTabletWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width <= AppConst.maxTablet && width > AppConst.maxPhone;
  }

  bool get isDesktopWidth {
    final width = MediaQuery.sizeOf(this).width;
    return width >= AppConst.maxTablet;
  }

  WidthType get deviceTypeAccordingToMaxWidth {
    double width = MediaQuery.sizeOf(this).width;
    if (width <= AppConst.maxPhone) {
      return WidthType.phone;
    } else if (width <= AppConst.maxTablet) {
      return WidthType.tablet;
    }

    return WidthType.desktop;
  }

  WidthType deviceTypeAccordingToGivenWidth(double width) {
    if (width <= AppConst.maxPhone) {
      return WidthType.phone;
    } else if (width <= AppConst.maxTablet) {
      return WidthType.tablet;
    }

    return WidthType.desktop;
  }
}
