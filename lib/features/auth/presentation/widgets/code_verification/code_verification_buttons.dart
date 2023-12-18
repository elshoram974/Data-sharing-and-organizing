import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../auth_filled_button.dart';
import 'resend_code_button.dart';

class CodeVerificationButtons extends StatelessWidget {
  final String nextRoute;

  const CodeVerificationButtons(this.nextRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 53),
        AuthFilledButton(
          text: S.of(context).verify,
          onPressed: () {
            GoRouter.of(context).pushReplacement(nextRoute);
          },
        ),
        const SizedBox(height: 8),
        const ResendCodeButton(),
      ],
    );
  }
}
