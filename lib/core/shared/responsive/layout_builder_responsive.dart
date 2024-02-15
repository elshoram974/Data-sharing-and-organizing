import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class LayoutBuilderRes extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget desktop;
  const LayoutBuilderRes({
    super.key,
    required this.phone,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;
        if (width <= AppConst.maxPhone) {
          return phone;
        } else if (width <= AppConst.maxTablet) {
          return tablet;
        }

        return desktop;
      },
    );
  }
}
