import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../../user_home/presentation/widgets/circular_image_widget.dart';

class GroupAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GroupAppBar({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back),
        ),
        title: Row(
          children: [
            CircularImageWidget(
              imageLink: group.imageLink,
              dimension: 42,
              errorWidget: const GroupImage(),
            ),
            const SizedBox(width: .5 * AppConst.defaultPadding),
            Text(
              group.groupName,
              style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
