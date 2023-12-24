import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthField(
      label: S.of(context).emailAddress,
      hint: S.of(context).emailAddress,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
    );
  }
}
