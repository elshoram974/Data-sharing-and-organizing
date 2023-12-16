import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/auth_cubit.dart';

class RememberMeWidget extends StatelessWidget {
  const RememberMeWidget({super.key});
  @override
  Widget build(BuildContext context) {
    AuthCubit controller = ProviderDependency.auth;
    return BlocBuilder<AuthCubit, AuthState>(
      buildWhen: (p, c) => c is ChangeRememberMeState,
      builder: (context, state) {
        return CheckboxListTile(
          title: Text(S.of(context).rememberMe, style: AppStyle.styleRegular15),
          contentPadding: EdgeInsets.zero,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          visualDensity: VisualDensity.compact,
          value: controller.loginUser.keepLogin,
          onChanged: (val) => controller.changeRemember(),
        );
      },
    );
  }
}
