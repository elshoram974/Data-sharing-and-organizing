import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/shared/password_field.dart';

class PasswordFieldsWidgets extends StatelessWidget {
  const PasswordFieldsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: AutofillGroup(
        child: Column(
          children: [
            const SizedBox(height: 59),
            PasswordField(
              hint: S.of(context).currentPassword,
              newPassword: false,
              // onChanged: (val) => c.newPassword = val,
              textInputAction: TextInputAction.next,
              // onFieldSubmitted: (_) => c.focusNode.requestFocus(),
              validator: (val) => AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            PasswordField(
              hint: S.of(context).newPassword,
              newPassword: true,
              // onChanged: (val) => c.newPassword = val,
              textInputAction: TextInputAction.next,
              // onFieldSubmitted: (_) => c.focusNode.requestFocus(),
              validator: (val) => AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            PasswordField(
              hint: S.of(context).reTypeNewPassword,
              // focusNode: c.focusNode,
              newPassword: true,
              // onFieldSubmitted: (_) => c.saveNewPassword(),
              // validator: (val) => AppValidator.samePassword(val, c.newPassword),
            ),
          ],
        ),
      ),
    );
  }
}
