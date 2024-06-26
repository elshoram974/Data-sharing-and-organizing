import 'package:data_sharing_organizing/core/shared/circular_loading_indicator.dart';
import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/no_account_found_widget.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/new_group_cubit.dart';
import '../new_group_app_bar.dart';
import 'search_bar_widget/search_bar_members_persistent_header.dart';

class AddMembersBody extends StatelessWidget {
  const AddMembersBody({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.newGroup = BlocProvider.of<NewGroupCubit>(context);
    final NewGroupCubit c = ProviderDependency.newGroup;
    return BlocBuilder<NewGroupCubit, NewGroupState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: c.scrollController,
          physics: const BouncingScrollPhysics(),
          slivers: [
            NewGroupAppBar(
              subTitle: c.selectedMembers.isNotEmpty
                  ? S.of(context).selectedWithNumber(c.selectedMembers.length)
                  : "(${S.of(context).addMembers})",
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: SearchBarMembersPersistentHeader(),
            ),
            if (state is SearchMembersLoadingState && state.page == 1)
              const SliverToBoxAdapter(child: CircularLoadingIndicator()),
            if (c.currentMembers.isEmpty)
              SliverToBoxAdapter(
                child: const NoAccountFoundWidget().topPadding(100),
              ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: c.currentMembers.length,
                (BuildContext context, int i) {
                  return ResConstrainedBoxAlign(
                    child: MembersListTile(
                      onTileTapped: () => c.onTapUser(i),
                      memberEntity: c.currentMembers[i],
                    ),
                  );
                },
              ),
            ),
            if (state is SearchMembersLoadingState && state.page != 1)
              const SliverToBoxAdapter(child: CircularLoadingIndicator()),
          ],
        );
      },
    );
  }
}
