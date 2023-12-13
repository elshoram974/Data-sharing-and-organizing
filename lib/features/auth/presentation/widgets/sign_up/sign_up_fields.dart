import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_field.dart';
import '../auth_password_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          AuthField(
            label: S.of(context).name,
            hint: S.of(context).name,
            autofillHints: const [AutofillHints.name],
            keyboardType: TextInputType.name,
          ),
          AuthField(
            label: S.of(context).emailAddress,
            hint: S.of(context).emailAddress,
            autofillHints: const [AutofillHints.email],
            keyboardType: TextInputType.emailAddress,
          ),
          AuthPasswordField(
            label: S.of(context).password,
            hint: S.of(context).password,
            newPassword: false,
          ),
          AuthPasswordField(
            label: S.of(context).confirmPassword,
            hint: S.of(context).password,
            newPassword: false,
          ),
        ],
      ),
    );
  }
}
