import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

class SelectedIcon extends StatelessWidget {
  const SelectedIcon({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
      child: const CircleAvatar(
        radius: 8,
        backgroundColor: AppColor.active,
        child: Icon(
          Icons.check,
          size: 12,
          color: Colors.white,
        ),
      ),
    );
  }
}