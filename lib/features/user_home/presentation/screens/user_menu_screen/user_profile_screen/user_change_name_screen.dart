import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/edit_profile_repositories.dart';
import '../../../cubit/menu_cubits/change_name_cubit/change_name_cubit.dart';
import '../../../widgets/menu_widgets/profile/change_pass_widgets/change_password_buttons_widgets.dart';
import '../../../widgets/menu_widgets/profile/change_pass_widgets/password_fields_widgets.dart';

class UserChangeNameScreen extends StatelessWidget {
  const UserChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeNameCubit(sl.get<EditProfileRepositories>()),
      child: EmptyScreenWithTitle(
        title: S.of(context).changeName,
        bottomPadding: 0.5 * AppConst.defaultPadding,
        children: [
          ResConstrainedBoxAlign(
            child: Column(
              children: [
                Text(
                  S.of(context).yourNewPasswordMustBeDifferentFromPreviously,
                  style: AppStyle.styleRegular15.copyWith(fontSize: 12),
                ),
                const PasswordFieldsWidgets(),
                const ChangePasswordButtonsWidget(),
              ],
            ),
          ).horizontalPadding(AppConst.defaultPadding),
        ],
      ),
    );
  }
}
