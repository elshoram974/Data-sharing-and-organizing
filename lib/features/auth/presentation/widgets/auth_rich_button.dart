import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthRichButton extends StatelessWidget {
  const AuthRichButton({
    super.key,
    this.prefix,
    required this.prefixText,
    required this.buttonText,
    this.onTap,
    this.align = TextAlign.center,
  });
  final Widget? prefix;
  final TextAlign align;
  final String prefixText;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: RichText(
        textAlign: align,
        text: TextSpan(
          style: AppStyle.styleRegular15,
          children: [
            if (prefix != null)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: prefix!,
              ),
            TextSpan(
              text: prefixText,
            ),
            TextSpan(
              style: const TextStyle(color: AppColor.active),
              text: buttonText,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
