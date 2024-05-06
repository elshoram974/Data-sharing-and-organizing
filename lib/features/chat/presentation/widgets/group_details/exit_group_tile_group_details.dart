import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class ExitGroupTileGroupDetails extends StatelessWidget {
  const ExitGroupTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () {},
      title: S.of(context).exitGroup,
      color: AppColor.active,
      leading: const Icon(
        Icons.logout_outlined,
        color: AppColor.active,
      ),
    );
  }
}
