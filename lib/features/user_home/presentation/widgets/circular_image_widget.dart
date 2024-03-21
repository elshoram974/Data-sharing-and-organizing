import 'package:data_sharing_organizing/core/shared/image/open_image/open_image.dart';
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
    if (AppConst.isWeb) {
      return _CircularImageWidget(
        dimension: dimension,
        imageLink: imageLink,
        errorWidget: errorWidget,
      );
    }
    return Hero(
      tag: imageLink ?? UniqueKey(),
      child: _CircularImageWidget(
        dimension: dimension,
        imageLink: imageLink,
        errorWidget: errorWidget,
      ),
    );
  }
}

class _CircularImageWidget extends StatelessWidget {
  const _CircularImageWidget({
    required this.dimension,
    required this.imageLink,
    required this.errorWidget,
  });

  final double dimension;
  final String? imageLink;
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
      child: OpenImage(imageLink: imageLink, errorWidget: errorWidget),
    );
  }
}
