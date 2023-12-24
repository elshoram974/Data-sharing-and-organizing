import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/sign_up_cubit/sign_up_cubit.dart';
import 'sign_up_buttons/account_type_widget.dart';

class ChooseUserRole extends StatelessWidget {
  const ChooseUserRole({super.key});

  @override
  Widget build(BuildContext context) {
    SignUpCubit controller = ProviderDependency.signUp;
    return Padding(
      padding: const EdgeInsets.only(
        top: 2 * AppConst.defaultPadding,
        bottom: AppConst.defaultPadding,
      ),
      child: BlocBuilder<SignUpCubit, SignUpState>(
        buildWhen: (p, c) => c is ChooseUserRoleState,
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UserRoleWidget(
                title: S.of(context).personalAccount,
                group: controller.userRole,
                value: UserRole.personalUser,
                onChanged: (type) => controller.chooseUserRole(type!),
              ),
              Text(
                S.of(context).oR,
                style: const TextStyle(fontSize: 16),
              ),
              UserRoleWidget(
                title: S.of(context).businessAccount,
                group: controller.userRole,
                value: UserRole.businessAdmin,
                onChanged: (type) => controller.chooseUserRole(type!),
              ),
            ],
          );
        },
      ),
    );
  }
}
