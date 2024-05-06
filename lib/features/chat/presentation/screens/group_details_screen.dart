import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../widgets/group_details/app_bar/app_bar_group_details.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          AppBarGroupDetails(group: group),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}
