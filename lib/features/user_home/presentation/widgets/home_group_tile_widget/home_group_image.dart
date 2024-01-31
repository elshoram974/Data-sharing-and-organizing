import 'package:flutter/material.dart';

class HomeGroupImage extends StatelessWidget {
  const HomeGroupImage({super.key, required this.imageLink});

  final String? imageLink;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 21,
      foregroundImage: NetworkImage(imageLink ?? ''),
      backgroundImage: const NetworkImage(
        'https://artscimedia.case.edu/wp-content/uploads/sites/79/2016/12/14205134/no-user-image.gif',
      ),
    );
  }
}
