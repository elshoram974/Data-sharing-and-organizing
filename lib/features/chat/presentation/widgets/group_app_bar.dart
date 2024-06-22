import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'group_title.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRoute.groupDetails,
          extra: ProviderDependency.group.group,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColor.background(context),
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.25),
                offset: const Offset(0, 4)),
          ],
        ),
        child: AppBar(
          flexibleSpace: FlexibleSpaceBar(
            background: SafeArea(
              child: Row(
                children: [
                  IconButton(
                    onPressed: context.pop,
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(child: GroupTitle()),
                  const SizedBox(width: AppConst.defaultPadding)
                ],
              ),
            ),
          ),
          forceMaterialTransparency: true,
          automaticallyImplyLeading: false,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
