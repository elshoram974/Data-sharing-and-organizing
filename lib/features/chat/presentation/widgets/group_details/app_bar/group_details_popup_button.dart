import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/my_popup_button_item.dart';
import 'package:flutter/material.dart';

import '../../../screens/group_change_image.dart';
import '../../../screens/group_change_name.dart';

class GroupDetailsPopupButton extends StatelessWidget {
  const GroupDetailsPopupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      iconColor: Colors.black,
      padding: EdgeInsets.zero,
      itemBuilder: (context) {
        return [
          myPopupButton(
            null,
            S.of(context).changeGroupImage,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeGroupImageScreen(),
              ),
            ),
          ),
          myPopupButton(
            null,
            S.of(context).changeGroupName,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ChangeGroupNameScreen(),
              ),
            ),
          ),
        ];
      },
    );
  }
}
