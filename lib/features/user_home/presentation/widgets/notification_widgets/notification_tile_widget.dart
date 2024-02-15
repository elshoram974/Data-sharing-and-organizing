import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/group_home_entity.dart';
import '../home_widgets/home_group_tile_widget/home_group_image.dart';
import 'notification_tile_body.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.only(
        left: 8,
        right: AppConst.defaultPadding,
        bottom: 7,
        top: 7,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary),
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
      child: Row(
        children: [
          HomeGroupImage(imageLink: groupHomeEntity.imageLink),
          const SizedBox(width: 8),
          NotificationTileBody(groupHomeEntity: groupHomeEntity),
        ],
      ),
    );
  }
}
