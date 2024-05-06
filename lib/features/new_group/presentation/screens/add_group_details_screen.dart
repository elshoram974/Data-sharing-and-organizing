import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../widgets/add_group_details/group_name_image.dart';
import '../widgets/add_group_details/group_permissions_tile_widget.dart';
import '../widgets/add_group_details/members_count_widget.dart';
import '../widgets/new_group_app_bar.dart';

class AddGroupDetailsScreen extends StatelessWidget {
  const AddGroupDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List selectedUsers = [5, 6, 9]; // TODO: selected users
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
                      isAdmin: false,
                      name: "Adel Eid -> ${i + 1}",
                      imageLink:
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThOaoCj5ZMdS0xOCIYLMVT8ReRCVjCCzX01BPJH3MpsA&s',
                      lastLogin: DateTime.now().subtract(Duration(days: i)),
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
