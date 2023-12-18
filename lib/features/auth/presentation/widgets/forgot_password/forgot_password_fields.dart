import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_password_field.dart';

class ForgotPasswordFields extends StatelessWidget {
  const ForgotPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    return AutofillGroup(
      child: Column(
        children: [
          AuthPasswordField(
            label: S.of(context).newPassword,
            hint: S.of(context).password,
            newPassword: true,
          ),
          AuthPasswordField(
            label: S.of(context).confirmPassword,
            hint: S.of(context).password,
            newPassword: true,
          ),
        ],
      ),
    );
  }
}
