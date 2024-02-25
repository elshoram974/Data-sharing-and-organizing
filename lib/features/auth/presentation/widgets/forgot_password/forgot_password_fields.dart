import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/auth/presentation/cubit/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';

import '../auth_password_field.dart';

class ForgotPasswordFields extends StatelessWidget {
  const ForgotPasswordFields({super.key});

  @override
  Widget build(BuildContext context) {
    final CreateNewPasswordCubit c = ProviderDependency.createNewPassword;
    return Form(
      key: c.formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            AuthPasswordField(
              label: S.of(context).password,
              hint: S.of(context).password,
              newPassword: true,
              onChanged: (val) => c.newPassword = val,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => c.focusNode.requestFocus(),
              validator: (val) => AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            AuthPasswordField(
              label: S.of(context).confirmPassword,
              hint: S.of(context).password,
              focusNode: c.focusNode,
              newPassword: true,
              onFieldSubmitted: (_) => c.saveNewPassword(),
              validator: (val) => AppValidator.samePassword(val, c.newPassword),
            ),
          ],
        ),
      ),
    );
  }
}
