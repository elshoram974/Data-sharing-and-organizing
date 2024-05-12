import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import 'group_title.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupAppBar({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).push(AppRoute.groupDetails, extra: group),
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
                  Expanded(child: GroupTitle(group: group)),
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
