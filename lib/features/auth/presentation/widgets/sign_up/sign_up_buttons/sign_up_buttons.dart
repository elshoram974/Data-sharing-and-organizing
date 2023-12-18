import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../auth_filled_button.dart';
import '../choose_account_type.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const ChooseAccountType(),
        AuthFilledButton(
          text: S.of(context).signUp,
          onPressed: ProviderDependency.signUp.signUp,
        ),
      ],
    );
  }
}
// TextInput.finishAutofillContext();
