import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/functions/my_popup_button_item.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../cubit/menu_cubits/change_photo/change_photo_cubit.dart';

class ChangeImageButton extends StatelessWidget {
  const ChangeImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ChangePhotoCubit c = BlocProvider.of<ChangePhotoCubit>(context);

    return PopupMenuButton<EditPhotoSelectedPopUpItem>(
      iconSize: 42,
      splashRadius: 0,
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      onSelected: c.changeImage,
      itemBuilder: (context) {
        return [
          if (!AppConst.isWeb)
            myPopupButton(EditPhotoSelectedPopUpItem.openCamera,
                S.of(context).openCamera),
          if (!AppConst.isWeb)
            myPopupButton(EditPhotoSelectedPopUpItem.openGallery,
                S.of(context).openGallery),
          if (AppConst.isWeb)
            myPopupButton(
                EditPhotoSelectedPopUpItem.openFiles, S.of(context).openFiles),
          if (ProviderDependency.userMain.user.image != null)
            myPopupButton(
                EditPhotoSelectedPopUpItem.deletePhoto, S.of(context).delete),
        ];
      },
      child: const CircleAvatar(
        backgroundColor: AppColor.primary,
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
