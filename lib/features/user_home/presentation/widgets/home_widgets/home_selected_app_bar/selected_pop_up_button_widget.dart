import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/notification_enum.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/my_popup_button_item.dart';
import 'package:flutter/material.dart';

import '../../../cubit/user_home_cubit/user_home_cubit.dart';

class SelectedPopUpMenuButton extends StatelessWidget {
  const SelectedPopUpMenuButton({super.key, required this.cubit});
  final UserHomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<HomeSelectedPopUpItem>(
      position: PopupMenuPosition.under,
      onSelected: cubit.onSelectPopUpItem,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.primary),
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
      itemBuilder: (context) => [
        myPopupButton(
            HomeSelectedPopUpItem.exitGroup, S.of(context).exitGroups),
        myPopupButton(
            HomeSelectedPopUpItem.markAsUnRead, S.of(context).markAsUnRead),
        if (!cubit.isAllSelected)
          myPopupButton(
              HomeSelectedPopUpItem.selectAll, S.of(context).selectAll),
        if (cubit.isAllSelected)
          myPopupButton(
              HomeSelectedPopUpItem.deselectAll, S.of(context).deselectAll),
        if (cubit.selectedGroups.length == 1 &&
            cubit.selectedGroups.first.memberEntity.notification == NotificationEnum.notify)
          myPopupButton(HomeSelectedPopUpItem.muteNotification,
              S.of(context).muteNotification),
        if (cubit.selectedGroups.length == 1 &&
            cubit.selectedGroups.first.memberEntity.notification == NotificationEnum.withoutNotify)
          myPopupButton(HomeSelectedPopUpItem.unmuteNotification,
              S.of(context).unmuteNotification),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
