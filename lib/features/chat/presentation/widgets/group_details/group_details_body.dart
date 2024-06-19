import 'package:data_sharing_organizing/core/shared/circular_loading_indicator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../new_group/presentation/widgets/add_group_details/members_count_widget.dart';
import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';
import '../../cubit/group_details/group_details_cubit.dart';
import '../../widgets/group_details/add_members_tile_group_details.dart';
import '../../widgets/group_details/app_bar/app_bar_group_details.dart';
import '../../widgets/group_details/exit_group_tile_group_details.dart';
import '../../widgets/group_details/group_permissions_tile_group_details.dart';
import '../../widgets/group_details/media_docs_tile_group_details.dart';
import '../../widgets/group_details/members_list_group_details.dart';
import '../../widgets/group_details/mute_notifications_tile_group_details.dart';
import '../../widgets/group_details/view_all_members_button.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    ProviderDependency.groupDetails =
        BlocProvider.of<GroupDetailsCubitImp>(context);
    final GroupDetailsCubit c = ProviderDependency.groupDetails;

    return BlocBuilder<GroupDetailsCubitImp, GroupDetailsState>(
      builder: (context, state) {
        final List<GroupMember> members = c.members;
        return CustomScrollView(
          slivers: [
            AppBarGroupDetails(group: group),
            const MediaDocsTileGroupDetails(),
            const MuteNotificationsTileGroupDetails(),
            if (group.memberEntity.isAdmin)
              const GroupPermissionsTileGroupDetails(),
            MembersCountWidget(
              topPadding: 44,
              bottomPadding: 0,
              selectedUsers: members,
            ),
            if (group.memberEntity.isAdmin) const AddMembersTileGroupDetails(),
            if (state is MembersLoadingState)
              const SliverToBoxAdapter(child: CircularLoadingIndicator()),
            MembersListGroupDetails(
              list: members
                  .getRange(0, members.length >= 6 ? 6 : members.length)
                  .toList(),
              group: group,
            ),
            if (members.length > 6)
              ViewAllMembersButton(list: members, group: group),
            const ExitGroupTileGroupDetails(),
          ],
        );
      },
    );
  }
}
