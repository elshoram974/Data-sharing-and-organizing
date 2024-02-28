import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AndroidImage extends StatelessWidget {
  const AndroidImage({
    super.key,
    required this.imageLink,
    this.errorWidget,
  });

  final String? imageLink;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: errorWidget == null ? null : (_, url, e) => errorWidget!,
    );
  }
}