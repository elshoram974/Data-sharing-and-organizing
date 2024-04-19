import 'dart:math' as math;

import 'package:flutter/material.dart';

class MyAttachmentButtonIcon extends StatelessWidget {
  const MyAttachmentButtonIcon({super.key, this.iconColor = Colors.white});

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: math.pi / 4,
      child: Icon(
        Icons.attach_file_outlined,
        color: iconColor,
      ),
    );
  }
}
