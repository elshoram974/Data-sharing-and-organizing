import 'package:data_sharing_organizing/core/shared/logo_widget.dart';
import 'package:flutter/material.dart';

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({
    super.key,
    required this.animation,
    required this.logoSize,
  });

  final Animation<double> animation;
  final double logoSize;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: LogoWidget(size: logoSize),
    );
  }
}
