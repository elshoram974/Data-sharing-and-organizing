import 'package:flutter/material.dart';

import 'person.dart';

class WebImage extends StatelessWidget {
  const WebImage({super.key, required this.imageLink});

  final String imageLink;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      fit: BoxFit.cover,
      placeholder: '',
      image: imageLink,
      imageErrorBuilder: (_, e, s) => const PersonImage(),
      placeholderErrorBuilder: (_, e, s) => const PersonImage(),
    );
  }
}