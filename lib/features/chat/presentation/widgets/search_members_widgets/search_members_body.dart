import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../../../../new_group/presentation/widgets/add_member/search_bar_widget/search_bar_members.dart';
import '../../../data/models/search_member_model/searched_member_model.dart';

class SearchMembersBody extends StatelessWidget {
  const SearchMembersBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<SearchedMemberModel> list = [
      SearchedMemberModel(
        userId: 1,
        firstName: 'firstName',
        lastName: 'lastName',
        lastLogin: DateTime.now(),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonLeading(showBackButton: true),
        leadingWidth: 77,
      ),
      body: Column(
        children: [
          SearchBarMember(
            maxHeight: 40,
            onChanged: (val) {},
            onSubmitted: (val) {},
          ),
          Expanded(
            child: ListView.builder(
              itemCount: list.length,
              padding: const EdgeInsets.symmetric(vertical: 50),
              itemBuilder: (context, index) {
                final SearchedMemberModel searchedMember = list[index];
                return ResConstrainedBoxAlign(
                  child: MembersListTile(
                    onTileTapped: () {},
                    memberEntity: MemberListTileEntity(
                      id: searchedMember.userId,
                      isAdmin: false,
                      name:
                          '${searchedMember.firstName} ${searchedMember.lastName}',
                      imageLink: searchedMember.image,
                      lastLogin: searchedMember.lastLogin,
                      isSelected: false,
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
