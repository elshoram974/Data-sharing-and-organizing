import 'package:flutter/material.dart';

import '../../utils/constants/app_constants.dart';
import '../../utils/entities/member_list_tile_entity.dart';
import '../../utils/extension/responsive_ex.dart';
import 'member_image_in_tile.dart';
import 'member_tile_body_widget.dart';

class MembersListTile extends StatelessWidget {
  const MembersListTile({super.key, required this.memberEntity});
  final MemberListTileEntity memberEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: memberEntity.onTileTapped,
      borderRadius: context.isPhoneWidth
          ? null
          : BorderRadius.circular(AppConst.borderRadius),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 5,
          horizontal: AppConst.defaultPadding,
        ),
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
            )
          ],
        ),
      ),
    );
  }
}
