import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'group_details_list_tile.dart';

class GroupPermissionsTileGroupDetails extends StatelessWidget {
  const GroupPermissionsTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () => context.push(AppRoute.groupPermissions),
      title: S.of(context).groupPermissions,
      leading: Icon(
        Icons.settings_outlined,
        color: Theme.of(context).textTheme.bodyLarge?.color,
      ),
    );
  }
}
