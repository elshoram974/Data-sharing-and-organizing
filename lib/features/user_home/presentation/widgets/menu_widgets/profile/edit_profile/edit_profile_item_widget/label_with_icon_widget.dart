import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class LabelWithIconWidget extends StatelessWidget {
  const LabelWithIconWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        Text(label, style: AppStyle.styleBoldInika24.copyWith(fontSize: 16))
      ],
    );
  }
}
