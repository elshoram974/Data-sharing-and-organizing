import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:flutter/material.dart';

import '../../circular_image_widget.dart';

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
    return CircularImageWidget(
      imageLink: imageLink,
      dimension: dimension,
      errorWidget: const PersonImage(),
    );
  }
}

