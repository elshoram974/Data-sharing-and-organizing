import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/fields_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/app_validate.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../cubit/recoverAccount_cubit/recover_account_cubit.dart';
import '../auth_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final RecoverAccountCubit cubit = ProviderDependency.recoverAccount;
    return AuthField(
      fieldKey: cubit.formKey ,
      label: S.of(context).emailAddress,
      hint: S.of(context).emailAddress,
      autofillHints: const [AutofillHints.email],
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.done,
      onSaved: (val) => cubit.email = val!.trim(),
      onFieldSubmitted: (_) => cubit.recoverAccount() ,
      validator: (val) => AppValidator.auth(val?.trim(), 0, 200, FieldType.email),
    );
  }
}
