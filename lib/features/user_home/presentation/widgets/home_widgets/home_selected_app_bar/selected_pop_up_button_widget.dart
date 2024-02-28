import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/enums/home_selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/home_pop_up_item_entity.dart';
import '../../../cubit/user_home_cubit/user_home_cubit.dart';

class SelectedPopUpMenuButton extends StatelessWidget {
  const SelectedPopUpMenuButton({super.key, required this.cubit});
  final UserHomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    final List<HomePopUpItemEntity> homeList = HomePopUpItemEntity.list(context, cubit);

    return PopupMenuButton<HomeSelectedPopUpItem>(
      position: PopupMenuPosition.under,
      onSelected: cubit.onSelectPopUpItem,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: AppColor.primary),
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
      ),
      itemBuilder: (context) => [
        for (final HomePopUpItemEntity e in homeList)
          if (e.isVisible)
            PopupMenuItem(
              value: e.value,
              child: Text(
                e.text,
                style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
              ),
            ),
      ],
      child: const Icon(Icons.more_vert),
    );
  }
}
