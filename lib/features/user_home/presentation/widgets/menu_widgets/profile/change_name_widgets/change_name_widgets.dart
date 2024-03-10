import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/menu_cubits/change_name_cubit/change_name_cubit.dart';

class ChangeNameButtonsWidget extends StatelessWidget {
  const ChangeNameButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangeNameCubit c = BlocProvider.of<ChangeNameCubit>(context);

    return BlocBuilder<ChangeNameCubit, ChangeNameState>(
      buildWhen: (p, c) => c is ChangeNameValidFields,
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          child: MyFilledButton(
            text: S.of(context).save,
            onPressed: state is ChangeNameValidFields
                ? state.isValid
                    ? c.changeName
                    : null
                : null,
          ),
        );
      },
    );
  }
}
