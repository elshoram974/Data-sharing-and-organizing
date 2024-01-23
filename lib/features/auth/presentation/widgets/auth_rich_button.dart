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
    this.padding = EdgeInsets.zero,
  });
  final EdgeInsetsGeometry padding;
  final Widget? prefix;
  final TextAlign align;
  final String prefixText;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: RichText(
        textAlign: align,
        text: TextSpan(
          style: AppStyle.styleRegular15,
          children: [
            if (prefix != null)
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.5),
                  child: prefix!,
                ),
              ),
            TextSpan(
              text: prefixText,
            ),
            TextSpan(
              style: TextStyle(color: onTap == null ? null : AppColor.active),
              text: buttonText,
              recognizer: TapGestureRecognizer()..onTap = onTap,
            ),
          ],
        ),
      ),
    );
  }
}
