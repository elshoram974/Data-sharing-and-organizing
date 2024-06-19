import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:flutter/material.dart';

import '../../../../new_group/presentation/widgets/add_member/search_bar_widget/search_bar_members.dart';

class SearchMembersBody extends StatelessWidget {
  const SearchMembersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonLeading(showBackButton: true),
        leadingWidth: 77,
      ),
      body: Column(
        children: [
          SearchBarMember(maxHeight: 40),
          Expanded(
            child: ListView(
              
            ),
          ),
        ],
      ),
    );
  }
}
