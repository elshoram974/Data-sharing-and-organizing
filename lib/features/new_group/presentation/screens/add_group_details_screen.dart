import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../../../chat/data/models/group_details_members/group_members_model.dart';
import '../widgets/add_group_details/group_name_image.dart';
import '../widgets/add_group_details/group_permissions_tile_widget.dart';
import '../widgets/add_group_details/members_count_widget.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupDetailsScreen extends StatelessWidget {
  const AddGroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GroupMember> selectedUsers = []; // TODO: selected users
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {}, // TODO: navigate to group screen
        backgroundColor: AppColor.active,
        child: const Icon(Icons.check_rounded, color: Colors.white),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const NewGroupAppBar(),
          const GroupNameAndImage(),
          const GroupPermissionsTileWidget(),
          MembersCountWidget(selectedUsers: selectedUsers),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: selectedUsers.length,
              (BuildContext context, int i) {
                return ResConstrainedBoxAlign(
                  child: MembersListTile(
                    onTileTapped: () {},
                    memberEntity: MemberListTileEntity(
                      id: selectedUsers[i].memberId,
                      isAdmin: selectedUsers[i].isAdmin,
                      name:
                          '${selectedUsers[i].firstName} ${selectedUsers[i].lastName}}',
                      imageLink: selectedUsers[i].image,
                      lastLogin: selectedUsers[i].lastLogin,
                      isSelected: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
