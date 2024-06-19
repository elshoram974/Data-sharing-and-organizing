import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../new_group/presentation/widgets/add_member/search_bar_widget/search_bar_members.dart';
import '../../cubit/search_members_cubit/search_members_cubit.dart';
import 'searched_members_list.dart';

class SearchMembersBody extends StatelessWidget {
  const SearchMembersBody({super.key});

  @override
  Widget build(BuildContext context) {
    final SearchMembersCubit c = BlocProvider.of<SearchMembersCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonLeading(showBackButton: true),
        leadingWidth: 77,
      ),
      body: Column(
        children: [
          SearchBarMember(
            maxHeight: 40,
            onSearch: c.searchMembers,
            onChanged: c.onChangeQuery,
          ),
          const SearchedMembersList(),
        ],
      ),
    );
  }
}
