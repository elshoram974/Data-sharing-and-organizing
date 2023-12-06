import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class RecoverAccountButton extends StatelessWidget {
  const RecoverAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: RichText(
        textAlign: TextAlign.end,
        text: TextSpan(
          style: AppStyle.styleRegular15,
          text: S.of(context).forgetPassword,
          children: [
            TextSpan(
              style: const TextStyle(color: AppColor.active),
              text: S.of(context).recover,
            )
          ],
        ),
      ),
    );
  }
}
