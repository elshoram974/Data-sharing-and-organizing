import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/menu_cubits/change_name_cubit/change_name_cubit.dart';
import 'name_field_widget.dart';

class NameFieldsWidgets extends StatelessWidget {
  const NameFieldsWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeNameCubit c = BlocProvider.of<ChangeNameCubit>(context);
    return Form(
      key: c.formKey,
      child: AutofillGroup(
        child: Column(
          children: [
            NameFieldWidget(
              initialValue: c.firstName,
              onChanged: c.onChangeFirstName,
              hintText: S.of(context).firstName,
            ),
            NameFieldWidget(
              initialValue: c.lastName,
              onChanged: c.onChangeLastName,
              hintText: S.of(context).lastName,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => c.changeName(),
            ),
          ],
        ),
      ),
    );
  }
}
