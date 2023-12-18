import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_buttons/account_type_widget.dart';

class ChooseAccountType extends StatelessWidget {
  const ChooseAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit controller = ProviderDependency.signUp;
    return Padding(
      padding: const EdgeInsets.only(
        top: 2 * AppConst.defaultPadding,
        bottom: AppConst.defaultPadding,
      ),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (p, c) => c is ChooseAccountTypeState,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AccountTypeWidget(
                title: S.of(context).personalAccount,
                group: controller.accountType,
                value: AccountType.personal,
                onChanged: (type) => controller.chooseAccountType(type!),
              ),
              Text(
                S.of(context).oR,
                style: const TextStyle(fontSize: 16),
              ),
              AccountTypeWidget(
                title: S.of(context).businessAccount,
                group: controller.accountType,
                value: AccountType.business,
                onChanged: (type) => controller.chooseAccountType(type!),
              ),
            ],
          );
        },
      ),
    );
  }
}
