import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';
import '../../../data/models/group_details_members/group_members_model.dart';
import '../../cubit/group_details/group_details_cubit.dart';

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
              thisUserIsAdmin: group.memberEntity.isAdmin,
              onTileTappedDown: group.memberEntity.isAdmin &&
                      i != 0 &&
                      !(list[i].memberId == group.ownerId && list[i].isAdmin)
                  ? (_) => editMembersMenu(context, _, list[i])
                  : null,
              memberEntity: MemberListTileEntity(
                id: list[i].memberId,
                name: "${list[i].firstName} ${list[i].lastName}",
                isAdmin: list[i].isAdmin,
                isBlocked: !list[i].canInteraction,
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
  GroupMember member,
) {
  final double x = offset.globalPosition.dx;
  final double y = offset.globalPosition.dy;
  final Size size = MediaQuery.sizeOf(context);

  final GroupDetailsCubitImp c = ProviderDependency.groupDetails;
  showMenu(
    context: context,
    position: RelativeRect.fromLTRB(x, y, size.width - x, size.height - y),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppConst.borderRadius),
    ),
    items: [
      PopupMenuItem(
        onTap: () => c.removeMember(member),
        child: Text(S.of(context).remove),
      ),
      if (member.isAdmin)
        PopupMenuItem(
          onTap: () => c.changeAdmin(false, member),
          child: Text(S.of(context).dismissAsAdmin),
        )
      else ...[
        if (!member.canInteraction)
          PopupMenuItem(
            onTap: () => c.changeInteraction(true, member.memberId),
            child: Text(S.of(context).unBlockThisUser),
          )
        else
          PopupMenuItem(
            onTap: () => c.changeInteraction(false, member.memberId),
            child: Text(S.of(context).blockThisUser),
          ),
        PopupMenuItem(
          onTap: () => c.changeAdmin(true, member),
          child: Text(S.of(context).promoteGroupAdmin),
        ),
      ],
    ],
    elevation: 8.0,
  );
}
