import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/features/chat/presentation/screens/search_members_screen.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class AddMembersTileGroupDetails extends StatelessWidget {
  const AddMembersTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => const SearchMembersScreen(),
        ),
      ),
      title: S.of(context).addMembers,
      color: AppColor.active,
      leading: const Icon(
        Icons.person_add_alt,
        color: AppColor.active,
      ),
    );
  }
}
