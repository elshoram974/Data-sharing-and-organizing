import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class InManyDevice extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  const InManyDevice({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if (width <= AppConst.maxPhone) {
      return phone;
    } else if (width <= AppConst.maxTablet) {
      return tablet;
    }

    return desktop;
  }
}
