import 'package:data_sharing_organizing/core/shared/app_logo_Name_home.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/user_home_cubit/user_home_cubit.dart';
import '../home_widgets/home_selected_app_bar/home_selected_app_bar.dart';

class MainUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainUserAppBar({super.key, this.hight = 110});
  final double hight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
        vertical: 11,
      ),
      alignment: Alignment.bottomLeft,
      decoration: appBarDecoration(context),
      child: const _AppBarBody(),
    );
  }

  BoxDecoration appBarDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 4),
        )
      ],
    );
  }

  @override
  Size get preferredSize =>
      Size(double.maxFinite, AppConst.isWeb ? hight / 1.7 : hight);
}

class _AppBarBody extends StatelessWidget {
  const _AppBarBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      buildWhen: (p, c) => c is UserHomeSelectGroups,
      builder: (context, state) {
        final UserHomeCubit c = ProviderDependency.userHome;
        return Visibility(
          visible: c.isSelected,
          replacement: const AppLogoWithNameHome(),
          child: HomeSelectedAppBar(cubit: c),
        );
      },
    );
  }
}
