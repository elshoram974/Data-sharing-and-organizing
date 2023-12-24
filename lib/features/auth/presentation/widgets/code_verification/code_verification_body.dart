import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_body.dart';
import 'code_fields.dart';
import 'code_verification_buttons.dart';

class CodeVerificationBody extends StatelessWidget {
  final String nextRoute;

  const CodeVerificationBody(this.nextRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      introHeader: S.of(context).codeVerification,
      introBody: S.of(context).enterDigitCodeThatHasBeenSentToYourEmail,
      children: [
        const CodeFields(),
        CodeVerificationButtons(nextRoute),
      ],
    );
  }
}
