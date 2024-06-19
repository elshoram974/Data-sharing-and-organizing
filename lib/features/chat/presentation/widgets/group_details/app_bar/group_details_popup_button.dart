import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/my_popup_button_item.dart';
import 'package:flutter/material.dart';

enum GroupEditEnum { name, image }

class GroupDetailsPopupButton extends StatelessWidget {
  const GroupDetailsPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<GroupEditEnum>(
      position: PopupMenuPosition.under,
      iconColor: Colors.black,
      padding: EdgeInsets.zero,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          myPopupButton(GroupEditEnum.image, S.of(context).changeGroupImage),
          myPopupButton(GroupEditEnum.name, S.of(context).changeGroupName),
        ];
      },
    );
  }
}
