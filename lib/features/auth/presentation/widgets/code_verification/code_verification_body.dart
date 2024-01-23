import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/verify_code_cubit/verify_code_cubit.dart';
import '../auth_body.dart';
import 'code_fields.dart';
import 'code_verification_buttons.dart';

class CodeVerificationBody extends StatelessWidget {
  final String nextRoute;

  const CodeVerificationBody(this.nextRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.verificationCode = BlocProvider.of<VerifyCodeCubit>(context);
    return AuthBody(
      introHeader: S.of(context).codeVerification,
      introBody: S.of(context).enterDigitCodeThatHasBeenSentToYourEmail,
      onWillPop: ProviderDependency.verificationCode.onWillPop ,
      children: [
        const CodeFields(),
        CodeVerificationButtons(nextRoute),
      ],
    );
  }
}
