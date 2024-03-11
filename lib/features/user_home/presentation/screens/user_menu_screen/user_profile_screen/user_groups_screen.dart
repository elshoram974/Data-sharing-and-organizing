import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/shared/empty_page_text.dart';
import '../../../../domain/entities/group_home_entity.dart';
import '../../../cubit/user_home_cubit/user_home_cubit.dart';
import '../../../widgets/home_widgets/home_group_tile_widget/home_group_tile.dart';
import '../../../widgets/home_widgets/home_selected_app_bar/home_selected_app_bar.dart';
import '../../home/user_home_screen.dart';

class UserGroupsScreen extends StatelessWidget {
  const UserGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<UserHomeCubit>(param1: true),
      child: const Scaffold(
        appBar: YourGroupAppBar(),
        body: UserGroupsBody(),
      ),
    );
  }
}

class UserGroupsBody extends StatelessWidget {
  const UserGroupsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final UserHomeCubit c = BlocProvider.of<UserHomeCubit>(context);
    return RefreshIndicator(
      onRefresh: c.getGroups,
      child: BlocBuilder<UserHomeCubit, UserHomeState>(
        builder: (context, state) {
          return ListView(
            controller: c.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            padding:
                const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
            children: [
              if (state is GetGroupsLoadingState && state.inFirst)
                const GetGroupsLoading(),
              if (c.myGroups.isEmpty)
                EmptyPageText(S.of(context).youCanMakeNewGroups),
              ...List.generate(
                c.myGroups.length,
                (index) {
                  final GroupHomeEntity group = c.myGroups[index];
                  return HomeGroupTile(
                    onTap: () => c.onTapGroup(group),
                    onLongPress: () => c.onLongTapGroup(group),
                    groupHomeEntity: group,
                  );
                },
              ),
              if (state is GetGroupsLoadingState && !state.inFirst)
                const GetGroupsLoading(),
            ],
          );
        },
      ),
    );
  }
}

class YourGroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const YourGroupAppBar({super.key, this.hight = 60});

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
