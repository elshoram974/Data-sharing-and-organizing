import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GroupPermissionsTileWidget extends StatelessWidget {
  const GroupPermissionsTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: AppConst.defaultPadding,
        ),
        child: ResConstrainedBoxAlign(
          child: Column(
            children: [
              const Divider(),
              Row(
                children: [
                  Text(
                    S.of(context).groupPermissions,
                    style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {}, // TODO: go to permission screen
                    icon: const Icon(Icons.settings_outlined),
                  )
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}