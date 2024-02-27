import 'package:data_sharing_organizing/core/shared/image/android_image.dart';
import 'package:data_sharing_organizing/core/shared/image/web_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class CircularImageWidget extends StatelessWidget {
  const CircularImageWidget({
    super.key,
    required this.imageLink,
    required this.dimension,
    this.errorWidget,
  });

  final String? imageLink;
  final double dimension;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dimension,
      width: dimension,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        color: AppColor.secondary,
        shape: BoxShape.circle,
      ),
      child: AppConst.isWeb
          ? WebImage(imageLink: imageLink, errorWidget: errorWidget)
          : AndroidImage(imageLink: imageLink, errorWidget: errorWidget),
    );
  }
}
