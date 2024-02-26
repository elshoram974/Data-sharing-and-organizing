import 'package:flutter/material.dart';

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
    return Image.network(
      imageLink ?? '',
      errorBuilder: errorWidget == null ? null : (_, e, s) => errorWidget!,
      fit: BoxFit.cover,
    );
  }
}
