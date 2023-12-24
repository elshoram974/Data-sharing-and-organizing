import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../cubit/login_cubit/login_cubit.dart';
import '../auth_field.dart';
import '../auth_password_field.dart';

class LoginFields extends StatelessWidget {
  const LoginFields({super.key});

  @override
  Widget build(BuildContext context) {
    LoginCubit c = ProviderDependency.login;
    return AutofillGroup(
      child: Form(
        key: c.formKey,
        child: Column(
          children: [
            AuthField(
              label: S.of(context).emailAddress,
              hint: S.of(context).emailAddress,
              autofillHints: const [AutofillHints.email],
              keyboardType: TextInputType.emailAddress,
              onSaved: (val) => c.email = val!.trim(),
              validator: (val) =>
                  AppValidator.auth(val?.trim(), 0, 200, FieldType.email),
            ),
            AuthPasswordField(
              label: S.of(context).password,
              hint: S.of(context).password,
              newPassword: false,
              onSaved: (val) => c.password = val!,
              validator: (val) =>
                  AppValidator.auth(val, 0, 200, FieldType.password),
              onFieldSubmitted: (val) => c.login(),
            ),
          ],
        ),
      ),
    );
  }
}
