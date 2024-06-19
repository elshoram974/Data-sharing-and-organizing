import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/my_popup_button_item.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../cubit/group_details/group_details_cubit.dart';

class ChangeGroupImageButton extends StatelessWidget {
  const ChangeGroupImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupDetailsCubitImp c = ProviderDependency.groupDetails;

    return PopupMenuButton<EditPhotoSelectedPopUpItem>(
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      onSelected: c.changeImage,
      itemBuilder: (context) {
        return [
          if (!AppConst.isWeb)
            myPopupButton(
              EditPhotoSelectedPopUpItem.openCamera,
              S.of(context).openCamera,
            ),
          if (!AppConst.isWeb)
            myPopupButton(
              EditPhotoSelectedPopUpItem.openGallery,
              S.of(context).openGallery,
            ),
          if (AppConst.isWeb)
            myPopupButton(
              EditPhotoSelectedPopUpItem.openFiles,
              S.of(context).openFiles,
            ),
          if (ProviderDependency.userMain.user.image != null)
            myPopupButton(
              EditPhotoSelectedPopUpItem.deletePhoto,
              S.of(context).delete,
            ),
        ];
      },
      iconColor: AppColor.primary,
      icon: const Icon(Icons.edit),
    );
  }
}
