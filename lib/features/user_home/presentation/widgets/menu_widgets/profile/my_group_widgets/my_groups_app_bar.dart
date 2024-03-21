import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubit/user_home_cubit/user_home_cubit.dart';
import '../../../home_widgets/home_selected_app_bar/home_selected_app_bar.dart';

class MyGroupsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyGroupsAppBar({super.key, this.hight = 60});

  final double hight;
  @override
  Widget build(BuildContext context) {
    final UserHomeCubit c = BlocProvider.of<UserHomeCubit>(context);
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      buildWhen: (p, c) => c is UserHomeSelectGroups,
      builder: (context, state) {
        return AppBar(
          leadingWidth: 100,
          leading: BackButtonLeading(showBackButton: !c.isSelected),
          title: Visibility(
            visible: c.isSelected,
            replacement: Text(
              S.of(context).yourGroups,
              style: AppStyle.styleBoldInika24.copyWith(fontSize: 36),
            ),
            child: HomeSelectedAppBar(cubit: c),
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, hight);
}
