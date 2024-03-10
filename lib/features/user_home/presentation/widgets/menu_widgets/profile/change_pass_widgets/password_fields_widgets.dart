import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/shared/password_field.dart';
import '../../../../cubit/menu_cubits/change_pass_cubit/change_pass_cubit.dart';

class PasswordFieldsWidgets extends StatelessWidget {
  const PasswordFieldsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePassCubit c = BlocProvider.of<ChangePassCubit>(context);
    return Form(
      key: c.formKey,
      onChanged: c.onFieldsChange,
      child: AutofillGroup(
        child: Column(
          children: [
            const SizedBox(height: 59),
            PasswordField(
              hint: S.of(context).currentPassword,
              newPassword: false,
              onChanged: (val) => c.oldPass = val,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => c.firstFocus.requestFocus(),
              validator: (val) => AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            PasswordField(
              focusNode: c.firstFocus,
              hint: S.of(context).newPassword,
              newPassword: true,
              onChanged: (val) => c.newPass = val,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => c.secondFocus.requestFocus(),
              validator: (val) => AppValidator.auth(val, 8, 200, FieldType.password),
            ),
            PasswordField(
              hint: S.of(context).reTypeNewPassword,
              focusNode: c.secondFocus,
              newPassword: true,
              onFieldSubmitted: (_) => c.changePass(),
              validator: (val) => AppValidator.samePassword(val, c.newPass),
            ),
          ],
        ),
      ),
    );
  }
}
