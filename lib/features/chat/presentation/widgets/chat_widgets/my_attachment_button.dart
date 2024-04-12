import 'package:flutter/material.dart';

class MyAttachmentButtonIcon extends StatelessWidget {
  const MyAttachmentButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 45,
      child: const Icon(
        Icons.attach_file_outlined,
        color: Colors.white,
      ),
    );
  }
}
