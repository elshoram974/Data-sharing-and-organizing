import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SelectBotButton extends StatelessWidget {
  const SelectBotButton({
    super.key,
    this.onPressed,
    this.backgroundColor,
    required this.text,
  });

  final void Function()? onPressed;
  final Color? backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          minimumSize: const Size(double.maxFinite, 27),
          backgroundColor: backgroundColor,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: AppStyle.styleBoldInika13.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
