import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth_filled_button.dart';

class ReturnToLogin extends StatelessWidget {
  const ReturnToLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          S.of(context).goTo,
          style: AppStyle.styleBoldInika24,
          textAlign: TextAlign.center,
        ),
        const Icon(Icons.arrow_downward, size: 42, weight: 700),
        AuthFilledButton(
          text: S.of(context).login,
          onPressed: context.pop,
        ),
      ],
    );
  }
}
