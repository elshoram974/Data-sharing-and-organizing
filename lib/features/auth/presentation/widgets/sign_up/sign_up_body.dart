import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_body.dart';
import 'sign_up_buttons/sign_up_buttons.dart';
import 'sign_up_fields.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      introHeader: S.of(context).signUp,
      introBody: S.of(context).createYourOwenEmail,
      children: const [
        SignUpFields(),
        SignUpButtons(),
      ],
    );
  }
}
