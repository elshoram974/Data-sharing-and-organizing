import 'package:cached_network_image/cached_network_image.dart';
// ignore: implementation_imports
import 'package:flutter_chat_ui/src/conditional/conditional.dart';
import 'package:flutter/material.dart';

ImageProvider<Object> imageProviderBuilder({
  required Conditional conditional,
  required Map<String, String>? imageHeaders,
  required String uri,
}) {
  final CachedNetworkImageProvider image = CachedNetworkImageProvider(
    uri,
    headers: imageHeaders,
  );
  return image;
}
