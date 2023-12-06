import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import 'outlined_button_text.dart';

class LoginOutlinedButton extends StatelessWidget {
  const LoginOutlinedButton({
    super.key,
    required this.text,
    required this.activeText,
    this.onPressed,
  });
  final String activeText;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(100, 48),
          backgroundColor: Colors.white,
          side: const BorderSide(color: AppColor.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
        child: OutlinedButtonText(text: text, activeText: activeText),
      ),
    );
  }
}
