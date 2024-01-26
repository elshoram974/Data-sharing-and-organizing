import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

import '../../cubit/verify_code_cubit/verify_code_cubit.dart';

class CodeFields extends StatelessWidget {
  const CodeFields({super.key});

  @override
  Widget build(BuildContext context) {
    final VerifyCodeCubit cubit = ProviderDependency.verificationCode;
    return Padding(
      padding: const EdgeInsets.only(top: 57),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Pinput(
          onChanged: (value) => cubit.code = value,
          onSubmitted: (val) => cubit.verifyCode(),
          onCompleted: (val) => cubit.verifyCode(),
          length: 6,
          autofocus: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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
    );
  }
}
