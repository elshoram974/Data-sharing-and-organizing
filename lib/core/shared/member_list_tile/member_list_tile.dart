import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/entities/member_list_tile_entity.dart';
import '../../utils/extension/responsive_ex.dart';
import 'member_image_in_tile.dart';
import 'member_tile_body_widget.dart';

class MembersListTile extends StatelessWidget {
  const MembersListTile({
    super.key,
    this.ownerId,
    this.thisUserIsAdmin,
    required this.memberEntity,
    this.onTileTapped,
    this.onTileTappedDown,
  });
  final int? ownerId;
  final bool? thisUserIsAdmin;
  final MemberListTileEntity memberEntity;
  final void Function()? onTileTapped;
  final Function(TapDownDetails)? onTileTappedDown;
  @override
  Widget build(BuildContext context) {
    final BorderRadius? borderRadius = context.isPhoneWidth
        ? null
        : BorderRadius.circular(AppConst.borderRadius);
    return InkWell(
      onTap: onTileTapped,
      onTapDown: onTileTappedDown,
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 0.5 * AppConst.defaultPadding,
          horizontal: AppConst.defaultPadding,
        ),
        decoration: BoxDecoration(
          color: memberEntity.isBlocked && thisUserIsAdmin == true
              ? AppColor.error
              : null,
          borderRadius: borderRadius,
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  MemberImageInTile(
                    imageLink: memberEntity.imageLink,
                    isSelected: memberEntity.isSelected,
                  ),
                  const SizedBox(width: 0.5 * AppConst.defaultPadding),
                  Flexible(
                    child: MemberTileBodyWidget(
                      name: memberEntity.name,
                      lastLogin: memberEntity.lastLogin,
                    ),
                  ),
                ],
              ),
            ),
            if (memberEntity.isAdmin)
              Container(
                decoration: BoxDecoration(
                  color: AppColor.active,
                  borderRadius: BorderRadius.circular(AppConst.borderRadius),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppConst.defaultPadding,
                  vertical: 4,
                ),
                child: Text(
                  memberEntity.id == ownerId
                      ? S.of(context).owner
                      : S.of(context).admin,
                  style: AppStyle.styleBoldInika13.copyWith(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
