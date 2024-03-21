import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_sharing_organizing/core/shared/full_screen_widget.dart';
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
    return FullScreenWidget(
      openFullPage: imageLink != null,
      widgetInFullScreen: _TheImage(
        imageLink: imageLink,
        errorWidget: errorWidget,
        fit: BoxFit.contain,
      ),
      child: _TheImage(imageLink: imageLink, errorWidget: errorWidget),
    );
  }
}

class _TheImage extends StatelessWidget {
  const _TheImage({
    required this.imageLink,
    required this.errorWidget,
    this.fit = BoxFit.cover,
  });

  final String? imageLink;
  final Widget? errorWidget;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink ?? '',
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: errorWidget == null ? null : (_, url, e) => errorWidget!,
    );
  }
}
