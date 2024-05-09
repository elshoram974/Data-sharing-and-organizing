import 'package:data_sharing_organizing/core/shared/member_list_tile/member_list_tile.dart';
import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/entities/member_list_tile_entity.dart';
import 'package:flutter/material.dart';

import '../../../../user_home/domain/entities/group_home_entity.dart';

class MembersListGroupDetails extends StatelessWidget {
  const MembersListGroupDetails({
    super.key,
    required this.list,
    required this.group,
  });

  final Iterable list;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: list.length,
        (BuildContext context, int i) {
          return ResConstrainedBoxAlign(
            child: MembersListTile(
              onTileTappedDown: group.memberEntity.isAdmin && i != 0
                  ? (_) => editMembersMenu(context, _, i == 0 || i == 5 || i == 8)
                  : null,
              memberEntity: MemberListTileEntity(
                name: "Adel Eid -> ${i + 1}",
                isAdmin: i == 0 || i == 5 || i == 8,
                imageLink:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThOaoCj5ZMdS0xOCIYLMVT8ReRCVjCCzX01BPJH3MpsA&s',
                lastLogin: DateTime.now().subtract(Duration(days: i)),
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
        ),
      if (!isAdmin)
        PopupMenuItem(
          onTap: () {},
          child: Text(S.of(context).promoteGroupAdmin),
        ),
    ],
    elevation: 8.0,
  );
}
