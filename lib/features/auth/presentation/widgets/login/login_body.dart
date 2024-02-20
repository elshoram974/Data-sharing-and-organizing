import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_body.dart';
import 'login_buttons/login_buttons.dart';
import 'login_fields.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      previousRouteNameFunction:(_)=> S.of(_).login,
      showBackButton: false,
      introHeader: S.of(context).welcomeBack,
      introBody: S.of(context).enterYourCredentialsToContinue,
      children: const [
        LoginFields(),
        LoginButtons(),
      ],
    );
  }
}
