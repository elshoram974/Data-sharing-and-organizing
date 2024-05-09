import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/add_group_details/members_count_widget.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_details/add_members_tile_group_details.dart';
import '../widgets/group_details/app_bar/app_bar_group_details.dart';
import '../widgets/group_details/exit_group_tile_group_details.dart';
import '../widgets/group_details/group_permissions_tile_group_details.dart';
import '../widgets/group_details/media_docs_tile_group_details.dart';
import '../widgets/group_details/members_list_group_details.dart';
import '../widgets/group_details/mute_notifications_tile_group_details.dart';
import '../widgets/group_details/view_all_members_button.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    final List list = [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarGroupDetails(group: group, membersLength: list.length),
          const MediaDocsTileGroupDetails(),
          const MuteNotificationsTileGroupDetails(),
          if (group.memberEntity.isAdmin)
            const GroupPermissionsTileGroupDetails(),
          MembersCountWidget(
            topPadding: 44,
            bottomPadding: 0,
            selectedUsers: list,
          ),
          if (group.memberEntity.isAdmin) const AddMembersTileGroupDetails(),
          MembersListGroupDetails(
            list: list.getRange(0, list.length >= 6 ? 6 : list.length),
            group: group,
          ),
          if (list.length > 6) ViewAllMembersButton(list: list, group: group),
          const ExitGroupTileGroupDetails(),
        ],
      ),
    );
  }
}
