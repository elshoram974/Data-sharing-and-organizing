import 'package:flutter/material.dart';

import '../choose_account_type.dart';
import 'sign_up_button.dart';

class SignUpButtons extends StatelessWidget {
  const SignUpButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChooseUserRole(),
        SignUpButton(),
      ],
    );
  }
}
// TextInput.finishAutofillContext();
