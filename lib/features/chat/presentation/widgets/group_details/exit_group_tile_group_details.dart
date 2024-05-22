import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import 'group_details_list_tile.dart';

class ExitGroupTileGroupDetails extends StatelessWidget {
  const ExitGroupTileGroupDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GroupDetailsListTile(
      onTap: () =>
          ProviderDependency.userHome.exitGroup(ProviderDependency.group.group),
      padding: const EdgeInsets.only(bottom: AppConst.defaultPadding),
      title: S.of(context).exitGroup,
      color: AppColor.active,
      leading: const Icon(
        Icons.logout_outlined,
        color: AppColor.active,
      ),
    );
  }
}
