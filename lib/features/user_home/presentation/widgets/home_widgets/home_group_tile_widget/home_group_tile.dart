import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/group_home_entity.dart';
import 'group_body/home_group_body.dart';
import 'group_image/home_group_image.dart';

class HomeGroupTile extends StatelessWidget {
  const HomeGroupTile({
    super.key,
    required this.groupHomeEntity,
    this.onTap,
    this.onLongPress,
  });

  final GroupHomeEntity groupHomeEntity;
  final void Function()? onTap;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      splashFactory: groupHomeEntity.isSelected ? NoSplash.splashFactory : null,
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.only(left: 8, right: AppConst.defaultPadding, bottom: 7, top: 7),
        decoration: BoxDecoration(
          color: groupHomeEntity.isSelected ? AppColor.selected : null,
          borderRadius: BorderRadius.circular(AppConst.borderRadius),
          border: Border.all(color: getBorderColor()),
        ),
        child: _GroupListTile(groupHomeEntity: groupHomeEntity),
      ),
    ).bottomPadding(25);
  }

  Color getBorderColor() {
    if (groupHomeEntity.isSelected) return AppColor.active;
    if (groupHomeEntity.isUnread) return AppColor.primary;
    return AppColor.gray;
  }
}

class _GroupListTile extends StatelessWidget {
  const _GroupListTile({required this.groupHomeEntity});

  final GroupHomeEntity groupHomeEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeGroupImage(groupHomeEntity: groupHomeEntity),
        const SizedBox(width: 8),
        HomeGroupBody(groupHomeEntity: groupHomeEntity),
      ],
    );
  }
}
