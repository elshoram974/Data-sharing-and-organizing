import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../cubit/sign_up_cubit/sign_up_cubit.dart';
import '../auth_field.dart';
import '../auth_password_field.dart';

class SignUpFields extends StatelessWidget {
  const SignUpFields({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit c = ProviderDependency.signUp;

    return AutofillGroup(
      child: Form(
        key: c.formKey,
        child: Column(
          children: [
            AuthField(
              label: S.of(context).name,
              hint: S.of(context).name,
              textDirection: null,
              autofillHints: const [AutofillHints.name],
              keyboardType: TextInputType.name,
              onSaved: (val) => c.name = val!.trim(),
              validator: (val) =>
                  AppValidator.auth(val?.trim(), 3, 200, FieldType.name),
            ),
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
              newPassword: true,
              onChanged: (val) => c.password = val,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => c.focusNode.requestFocus(),
              validator: (val) =>
                  AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            AuthPasswordField(
              label: S.of(context).confirmPassword,
              hint: S.of(context).password,
              focusNode: c.focusNode,
              newPassword: true,
              onFieldSubmitted: (_) => c.signUp(),
              validator: (val) => AppValidator.samePassword(val, c.password),
            ),
          ],
        ),
      ),
    );
  }
}
