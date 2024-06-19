import 'package:data_sharing_organizing/core/shared/circular_loading_indicator.dart';
import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:data_sharing_organizing/core/utils/functions/show_custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/search_member_model/searched_user_model.dart';
import '../../cubit/search_members_cubit/search_members_cubit.dart';

class SearchedMembersList extends StatelessWidget {
  const SearchedMembersList({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchMembersCubit c = BlocProvider.of<SearchMembersCubit>(context);
    return BlocBuilder<SearchMembersCubit, SearchMembersState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              if (state is SearchMembersLoadingState)
                const CircularLoadingIndicator(),
              Expanded(
                child: ListView.builder(
                  itemCount: c.currentSearched.length,
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  itemBuilder: (context, index) {
                    final SearchedUserModel searchedMember =
                        c.currentSearched[index];
                    return ResConstrainedBoxAlign(
                      child: MembersListTile(
                        onTileTapped: () {
                          final String name =
                              "${searchedMember.firstName} ${searchedMember.lastName}";
                          ShowCustomDialog.warning(
                            context,
                            body: S.of(context).doYouWantToAddName(name),
                            onPressConfirm: () {
                              Navigator.pop(context);
                              c.addMember(searchedMember);
                            },
                          );
                        },
                        memberEntity: MemberListTileEntity(
                          id: searchedMember.userId,
                          isAdmin: false,
                          isBlocked: false,
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
