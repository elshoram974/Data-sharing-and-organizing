import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/forgot_password_cubit/forgot_password_cubit.dart';
import '../auth_body.dart';
import 'forgot_password_fields.dart';
import 'forgot_password_button.dart';

class ForgotPasswordBody extends StatelessWidget {
  const ForgotPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.createNewPassword = BlocProvider.of<CreateNewPasswordCubit>(context);
    return AuthBody(
      currentRouteName: S.of(context).createNewPassword,
      introHeader: S.of(context).createNewPassword,
      introBody: S.of(context).yourNewPasswordMustBeDifferentFromPreviously,
      showBackButton: false,
      children: const [
        ForgotPasswordFields(),
        ForgotPasswordButton(),
      ],
    );
  }
}
