import 'package:data_sharing_organizing/core/shared/circular_loading_indicator.dart';
import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/search_member_model/searched_user_model.dart';
import '../../cubit/search_members_cubit/search_members_cubit.dart';

class SearchedMembersList extends StatelessWidget {
  const SearchedMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    List<SearchedUserModel> list = [];
    return BlocConsumer<SearchMembersCubit, SearchMembersState>(
      listener: (context, state) {
        if (state is SearchMembersSuccessState) {
          list = state.members;
        }
      },
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              if (state is SearchMembersLoadingState)
                const CircularLoadingIndicator(),
              Expanded(
                child: ListView.builder(
                  itemCount: list.length,
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  itemBuilder: (context, index) {
                    final SearchedUserModel searchedMember = list[index];
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
      },
    );
  }
}
