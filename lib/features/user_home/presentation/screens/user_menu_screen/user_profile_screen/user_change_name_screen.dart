import 'package:data_sharing_organizing/core/shared/empty_screen_with_title.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/repositories/edit_profile_repositories.dart';
import '../../../cubit/menu_cubits/change_name_cubit/change_name_cubit.dart';
import '../../../widgets/menu_widgets/profile/change_name_widgets/change_name_widgets.dart';
import '../../../widgets/menu_widgets/profile/change_name_widgets/name_fields.dart';

class UserChangeNameScreen extends StatelessWidget {
  const UserChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangeNameCubit(sl.get<EditProfileRepositories>()),
      child: EmptyScreenWithTitle(
        title: S.of(context).changeName,
        bottomPadding: 97,
        children: [
          const ResConstrainedBoxAlign(
            child: Column(
              children: [
                NameFieldsWidgets(),
                SizedBox(height: 100),
                ChangeNameButtonsWidget(),
              ],
            ),
          ).horizontalPadding(AppConst.defaultPadding),
        ],
      ),
    );
  }
}
