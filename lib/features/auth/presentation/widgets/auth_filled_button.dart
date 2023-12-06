import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class AuthFilledButton extends StatelessWidget {
  const AuthFilledButton({
    super.key,
    required this.text,
    this.onPressed,
  });
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: const Size(100, 48),
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
