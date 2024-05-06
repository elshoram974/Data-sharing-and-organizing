import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class GroupPermissionsTileGroupDetails extends StatelessWidget {
  const GroupPermissionsTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () {},
      title: 'Group permissions',
      leading: Icon(
        Icons.settings_outlined,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}
