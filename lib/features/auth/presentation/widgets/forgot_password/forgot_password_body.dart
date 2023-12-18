import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_body.dart';
import 'forgot_password_fields.dart';
import 'forgot_password_button.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      introHeader: S.of(context).createNewPassword,
      introBody: S.of(context).yourNewPasswordMustBeDifferentFromPreviously,
      showBackButton: false,
      children: const [
        ForgotPasswordFields(),
        ForgotPasswordButton(),
      ],
    );
  }
}
