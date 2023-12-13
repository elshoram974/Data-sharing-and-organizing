import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../auth_filled_button.dart';
import '../remember_me_widget.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const RememberMeWidget(),
        AuthFilledButton(
          text: S.of(context).signUp,
          onPressed: () {
            // Register Fn
          },
        ),
      ],
    );
  }
}
// TextInput.finishAutofillContext();
