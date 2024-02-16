import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NameAndArrowWidget extends StatelessWidget {
  const NameAndArrowWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(name, style: AppStyle.styleBoldInika16),
        const SizedBox(width: 20),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
