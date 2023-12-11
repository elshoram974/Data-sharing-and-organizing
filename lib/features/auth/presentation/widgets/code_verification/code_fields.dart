import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class CodeFields extends StatelessWidget {
  const CodeFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 57),
      child: Form(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Pinput(
            length: 6,
            autofocus: true,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            defaultPinTheme: PinTheme(
              height: 48,
              width: 54,
              textStyle: const TextStyle(color: Colors.black),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppStyle.styleRegular15.color!),
                borderRadius: BorderRadius.circular(AppConst.borderRadius),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
