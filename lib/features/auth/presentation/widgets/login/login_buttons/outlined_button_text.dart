import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class OutlinedButtonText extends StatelessWidget {
  const OutlinedButtonText({
    super.key,
    required this.text,
    required this.activeText,
  });

  final String text;
  final String activeText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(color: Colors.black, fontSize: 16),
        text: text,
        children: [
          TextSpan(
            style: const TextStyle(color: AppColor.active),
            text: activeText,
          )
        ],
      ),
    );
  }
}
