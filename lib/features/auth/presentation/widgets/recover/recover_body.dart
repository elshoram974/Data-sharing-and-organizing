import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/recoverAccount_cubit/recover_account_cubit.dart';
import '../auth_body.dart';
import 'email_field.dart';
import 'recover_buttons.dart';

class RecoverBody extends StatelessWidget {
  const RecoverBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.recoverAccount = BlocProvider.of<RecoverAccountCubit>(context);

    return AuthBody(
      currentRouteName: S.of(context).recoverYourAccount,
      introHeader: S.of(context).recoverYourAccount,
      introBody: S.of(context).enterYourCredentialsToContinue,
      onWillPop: ProviderDependency.recoverAccount.onWillPop,
      children: const [
        EmailField(),
        RecoverButtons(),
      ],
    );
  }
}
