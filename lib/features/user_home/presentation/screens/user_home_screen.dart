import 'package:data_sharing_organizing/core/shared/circular_loading_indicator.dart';
import 'package:data_sharing_organizing/core/shared/empty_page_text.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/group_home_entity.dart';
import '../cubit/user_home_cubit/user_home_cubit.dart';
import '../widgets/home_widgets/home_group_tile_widget/home_group_tile.dart';
import '../widgets/main_screen_widgets/main_body.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserHomeCubit c = ProviderDependency.userHome;
    return BlocBuilder<UserHomeCubit, UserHomeState>(
      builder: (context, state) {
        return RefreshIndicator(
          onRefresh: c.getGroups,
          child: MainBodyWidget(
            children: [
              if (state is GetGroupsLoadingState && state.inFirst)
                const CircularLoadingIndicator(),
              if (c.currentGroups.isEmpty)
                EmptyPageText(S.of(context).youCanMakeNewGroups),
              ...List.generate(
                c.currentGroups.length,
                (index) {
                  final GroupHomeEntity group = c.currentGroups[index];
                  return HomeGroupTile(
                    onTap: () => c.onTapGroup(group),
                    onLongPress: () => c.onLongTapGroup(group),
                    groupHomeEntity: group,
                  );
                },
              ),
              if (state is GetGroupsLoadingState && !state.inFirst)
                const CircularLoadingIndicator(),
            ],
          ),
        );
      },
    );
  }
}
