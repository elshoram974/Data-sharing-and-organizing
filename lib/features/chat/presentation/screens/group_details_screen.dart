import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../../../new_group/presentation/widgets/add_group_details/members_count_widget.dart';
import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_details/add_members_tile_group_details.dart';
import '../widgets/group_details/app_bar/app_bar_group_details.dart';
import '../widgets/group_details/exit_group_tile_group_details.dart';
import '../widgets/group_details/group_permissions_tile_group_details.dart';
import '../widgets/group_details/media_docs_tile_group_details.dart';
import '../widgets/group_details/mute_notifications_tile_group_details.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    final List list = [5, 6, 7, 8, 9, 10, 15, 16, 17, 18, 19, 20, 21, 22, 23];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarGroupDetails(group: group),
          const MediaDocsTileGroupDetails(),
          const MuteNotificationsTileGroupDetails(),
          const GroupPermissionsTileGroupDetails(),
          MembersCountWidget(
            topPadding: 44,
            bottomPadding: 0,
            selectedUsers: list,
          ),
          if (group.memberEntity.isAdmin) const AddMembersTileGroupDetails(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: list.length >= 6 ? 6 : list.length,
              (BuildContext context, int i) {
                return ResConstrainedBoxAlign(
                  child: MembersListTile(
                    memberEntity: MemberListTileEntity(
                      name: "Adel Eid -> ${i + 1}",
                      imageLink:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThOaoCj5ZMdS0xOCIYLMVT8ReRCVjCCzX01BPJH3MpsA&s',
                      lastLogin: DateTime.now().subtract(Duration(days: i)),
                      isSelected: false,
                    ),
                  ),
                );
              },
            ),
          ),
          const ExitGroupTileGroupDetails(),
        ],
      ),
    );
  }
}
