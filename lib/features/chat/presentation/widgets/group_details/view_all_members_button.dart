import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import 'members_list_group_details.dart';

class ViewAllMembersButton extends StatelessWidget {
  const ViewAllMembersButton({
    super.key,
    required this.list,
    required this.group,
  });

  final List list;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    _AllMembersScreen(group: group, list: list),
              ),
            );
          },
          child: Text(S.of(context).viewAllCountMore(list.length - 6)),
        ),
      ),
    );
  }
}

class _AllMembersScreen extends StatelessWidget {
  const _AllMembersScreen({
    required this.group,
    required this.list,
  });

  final GroupHomeEntity group;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(group.groupName),
            backgroundColor: AppColor.background(context),
            pinned: true,
          ),
          MembersListGroupDetails(list: list, group: group),
        ],
      ),
    );
  }
}
