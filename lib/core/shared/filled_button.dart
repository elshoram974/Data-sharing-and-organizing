import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MyFilledButton extends StatelessWidget {
  const MyFilledButton({
    super.key,
    required this.text,
    this.onPressed,
    this.style,
    this.filledColor,
    this.minimumSize,
  });
  final String text;
  final TextStyle? style;
  final Color? filledColor;
  final Size? minimumSize;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: minimumSize ?? const Size(100, 48),
        backgroundColor: filledColor ?? AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
        ),
      ),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ?? const TextStyle(color: Colors.white),
      ),
    );
  }
}
