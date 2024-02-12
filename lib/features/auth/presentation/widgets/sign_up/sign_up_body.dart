import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../auth_body.dart';
import 'sign_up_buttons/sign_up_buttons.dart';
import 'sign_up_fields.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.signUp = BlocProvider.of<SignUpCubit>(context);
    return AuthBody(
      previousRouteNameFunction:(_)=> S.of(_).signUp,
      introHeader: S.of(context).signUp,
      introBody: S.of(context).createYourOwenEmail,
      onWillPop: ProviderDependency.signUp.onWillPop,
      children: const [
        SignUpFields(),
        SignUpButtons(),
      ],
    );
  }
}
