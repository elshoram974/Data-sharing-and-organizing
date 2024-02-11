import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/group_home_entity.dart';
import 'home_group_body.dart';
import 'home_group_image.dart';

class HomeGroupTile extends StatelessWidget {
  const HomeGroupTile({super.key, required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(
        left: 8,
        right: AppConst.defaultPadding,
        bottom: 2,
      ),
      minVerticalPadding: 8,
      title: Row(
        children: [
          HomeGroupImage(imageLink: groupHomeEntity.imageLink),
          const SizedBox(width: 8),
          HomeGroupBody(groupHomeEntity: groupHomeEntity),
        ],
      ),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.primary),
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
    ).bottomPadding(25);
  }
}