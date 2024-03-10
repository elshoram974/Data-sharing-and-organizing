import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_status_enum.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../auth/data/models/app_user/user.dart';
import '../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../../../auth/presentation/widgets/auth_rich_button.dart';
import '../../../../cubit/menu_cubits/change_pass_cubit/change_pass_cubit.dart';

class ChangePasswordButtonsWidget extends StatelessWidget {
  const ChangePasswordButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePassCubit c = BlocProvider.of<ChangePassCubit>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AuthRichButton(
          padding: const EdgeInsets.only(top: AppConst.defaultPadding),
          align: TextAlign.start,
          prefixText: S.of(context).forgetPassword,
          buttonText: S.of(context).recover,
          onTap: () => recover(c.user),
        ),
        BlocBuilder<ChangePassCubit, ChangePassState>(
          buildWhen: (p, c) => c is ChangePassValidFields,
          builder: (context, state) {
            return MyFilledButton(
              text: S.of(context).changePassword,
              onPressed: state is ChangePassValidFields
                  ? state.isValid
                      ? c.changePass
                      : null
                  : null,
            );
          },
        ).verticalPadding(60),
      ],
    );
  }

  void recover(AuthUserEntity entity) {
    // * requestToSendCodeUseCase first and do it
    final User user = User(
      userId: entity.id,
      userEmail: entity.email,
      userFirstName: '',
      userLastName: '',
      userPassword: entity.password,
      userType: entity.userType,
      userStatus: UserStatus.active,
    );
    // dialog or go direct .. i see dialog is better
    ShowMyDialog.verifyDialog(user, AppRoute.forgotPassword);
  }
}
