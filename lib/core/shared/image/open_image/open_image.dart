import 'package:flutter/material.dart';

import '../../../utils/constants/app_constants.dart';
import 'android_image.dart';
import 'web_image.dart';

class OpenImage extends StatelessWidget {
  const OpenImage({
    super.key,
    required this.imageLink,
    required this.errorWidget,
  });

  final String? imageLink;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return AppConst.isWeb
        ? WebImage(imageLink: imageLink, errorWidget: errorWidget)
        : AndroidImage(imageLink: imageLink, errorWidget: errorWidget);
  }
}