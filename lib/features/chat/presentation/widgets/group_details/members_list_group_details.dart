import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';

class MembersListGroupDetails extends StatelessWidget {
  const MembersListGroupDetails({
    super.key,
    required this.list,
    required this.group,
  });

  final List<GroupMember> list;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (BuildContext context, int i) {
          return ResConstrainedBoxAlign(
            child: MembersListTile(
              ownerId: group.ownerId,
              onTileTappedDown: group.memberEntity.isAdmin && i != 0
                  ? (_) => editMembersMenu(
                        context,
                        _,
                        list[i].isAdmin,
                        !list[i].canInteraction,
                      )
                  : null,
              memberEntity: MemberListTileEntity(
                id: list[i].memberId,
                name: "${list[i].firstName} ${list[i].lastName}",
                isAdmin: list[i].isAdmin,
                imageLink: list[i].image,
                lastLogin: list[i].lastLogin,
                isSelected: false,
              ),
            ),
          );
        },
      ),
    );
  }
}

void editMembersMenu(
  BuildContext context,
  TapDownDetails offset,
  bool isAdmin,
  bool isBlocked,
) {
  final double x = offset.globalPosition.dx;
  final double y = offset.globalPosition.dy;
  final Size size = MediaQuery.sizeOf(context);
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(x, y, size.width - x, size.height - y),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
    ),
    items: [
      PopupMenuItem(
        onTap: () {},
        child: Text(S.of(context).remove),
      ),
      if (isAdmin)
        PopupMenuItem(
          onTap: () {},
          child: Text(S.of(context).dismissAsAdmin),
        )
      else ...[
        if (isBlocked)
          PopupMenuItem(
            onTap: () {},
            child: Text(S.of(context).unBlockThisUser),
          )
        else
          PopupMenuItem(
            onTap: () {},
            child: Text(S.of(context).blockThisUser),
          ),
        PopupMenuItem(
          onTap: () {},
          child: Text(S.of(context).promoteGroupAdmin),
        ),
      ],
    ],
    elevation: 8.0,
  );
}
