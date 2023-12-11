import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../auth_body.dart';
import 'email_field.dart';
import 'recover_buttons.dart';

class RecoverBody extends StatelessWidget {
  const RecoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBody(
      introHeader: S.of(context).recoverYourAccount,
      introBody: S.of(context).enterYourCredentialsToContinue,
      children: const [
        EmailField(),
        RecoverButtons(),
      ],
    );
  }
}
