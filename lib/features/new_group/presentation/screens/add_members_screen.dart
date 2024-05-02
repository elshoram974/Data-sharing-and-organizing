import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/add_member/search_bar_members.dart';
import '../widgets/new_group_app_bar.dart';

class AddMembersScreen extends StatelessWidget {
  const AddMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List selectedUsers = []; // TODO: selected users

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoute.addGroupDetails),
        backgroundColor: AppColor.active,
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          NewGroupAppBar(
            subTitle: selectedUsers.isNotEmpty
                ? S.of(context).selectedWithNumber(selectedUsers.length)
                : S.of(context).addMembers,
          ),
          SliverPersistentHeader(pinned: true, delegate: SearchBarMembers()),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 370,
              (BuildContext context, int i) {
                return ResConstrainedBoxAlign(
                  child: MembersListTile(
                    memberEntity: MemberListTileEntity(
                      name: "Adel Eid -> ${i + 1}",
                      imageLink: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThOaoCj5ZMdS0xOCIYLMVT8ReRCVjCCzX01BPJH3MpsA&s',
                      lastLogin: DateTime.now().subtract(Duration(days: i)),
                      isSelected: false,
                      onTileTapped: () {},
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
