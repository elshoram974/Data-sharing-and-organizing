import 'package:data_sharing_organizing/core/shared/image/android_image.dart';
import 'package:data_sharing_organizing/core/shared/image/web_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HomeGroupImage extends StatelessWidget {
  const HomeGroupImage({
    super.key,
    required this.imageLink,
    this.dimension = 42,
  });

  final String? imageLink;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: CustomSavedImage(imageLink: imageLink),
      ),
    );
  }
}

class CustomSavedImage extends StatelessWidget {
  const CustomSavedImage({super.key, required this.imageLink});

  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return AppConst.isWeb
        ? WebImage(imageLink: imageLink ?? '')
        : AndroidImage(imageLink: imageLink ?? '');
  }
}
