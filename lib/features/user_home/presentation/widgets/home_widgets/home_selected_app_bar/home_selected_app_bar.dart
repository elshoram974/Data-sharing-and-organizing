import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../cubit/user_home_cubit/user_home_cubit.dart';
import 'selected_pop_up_button_widget.dart';

class HomeSelectedAppBar extends StatelessWidget {
  const HomeSelectedAppBar({super.key, required this.cubit});
  final UserHomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).selectedWithNumber(cubit.selectedGroups.length),
          style: AppStyle.styleRegular24.copyWith(
            color: AppColor.active,
            fontWeight: FontWeight.w600,
          ),
        ),
        SelectedPopUpMenuButton(cubit: cubit),
      ],
    );
  }
}
