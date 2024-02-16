import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';

class ResConstrainedBoxAlign extends StatelessWidget {
  const ResConstrainedBoxAlign({
    super.key,
    this.maxHeight = double.infinity,
    this.maxWidth,
    this.maxWidthNotPhone,
    this.minHeight = 0.0,
    this.minWidth = 0.0,
    required this.child,
  });
  final double minWidth;
  final double? maxWidth;
  final double? maxWidthNotPhone;
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: maxHeight,
          maxWidth: maxWidth ??
              (context.isPhoneWidth
                  ? double.infinity
                  : maxWidthNotPhone ?? AppConst.constraint),
          minHeight: minHeight,
          minWidth: minWidth,
        ),
        child: child,
      ),
    );
  }
}

class ResConstrainedBox extends StatelessWidget {
  const ResConstrainedBox({
    super.key,
    this.maxHeight = double.infinity,
    this.maxWidth,
    this.maxWidthNotPhone,
    this.minHeight = 0.0,
    this.minWidth = 0.0,
    required this.child,
  });
  final double minWidth;
  final double? maxWidth;
  final double? maxWidthNotPhone;
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth ??
            (context.isPhoneWidth
                ? double.infinity
                : maxWidthNotPhone ?? AppConst.constraint),
        minHeight: minHeight,
        minWidth: minWidth,
      ),
      child: child,
    );
  }
}
