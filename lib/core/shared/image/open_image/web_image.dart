import 'package:flutter/material.dart';

import '../../full_screen_widget.dart';

class WebImage extends StatelessWidget {
  const WebImage({
    super.key,
    required this.imageLink,
    this.errorWidget,
  });

  final String? imageLink;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return FullScreenWidget(
      appBar: AppBar(leading: const CloseButton(color: Colors.white54)),
      openFullPage: imageLink != null,
      widgetInFullScreen: _TheImage(
        imageLink: imageLink,
        errorWidget: errorWidget,
        fit: BoxFit.contain,
      ),
      child: _TheImage(
        imageLink: imageLink,
        errorWidget: errorWidget,
      ),
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
    return Hero(
      tag: imageLink ?? errorWidget ?? '',
      child: Image.network(
        imageLink ?? '',
        errorBuilder: errorWidget == null ? null : (_, e, s) => errorWidget!,
        fit: fit,
      ),
    );
  }
}
