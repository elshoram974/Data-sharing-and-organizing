import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../domain/entities/pop_up_item_entity.dart';

class ChangeImageButton extends StatelessWidget {
  const ChangeImageButton({super.key});

  @override
  Widget build(BuildContext context) {
    final List<HomePopUpItemEntity> list = HomePopUpItemEntity.editPhotoList(context);
    return PopupMenuButton<EditPhotoSelectedPopUpItem>(
      iconSize: 42,
      splashRadius: 0,
      position: PopupMenuPosition.under,
      padding: EdgeInsets.zero,
      onSelected: (value) {},
      itemBuilder: (context) {
        return [
          for (final HomePopUpItemEntity e in list)
            if (e.isVisible)
              PopupMenuItem(
                value: e.value,
                child: Text(
                  e.text,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
                ),
              ),
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