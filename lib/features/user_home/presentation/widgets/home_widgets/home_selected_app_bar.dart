import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../cubit/user_home_cubit/user_home_cubit.dart';

class HomeSelectedAppBar extends StatelessWidget {
  const HomeSelectedAppBar({super.key, required this.cubit});
  final UserHomeCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).selectedWithNumber(cubit.selectedGroups.length),
          style: AppStyle.styleRegular24.copyWith(
            color: AppColor.active,
            fontWeight: FontWeight.w600,
          ),
        ),
        PopupMenuButton(
          padding: EdgeInsets.zero,
          position: PopupMenuPosition.under,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColor.primary),
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                child: Text(
                  S.of(context).exitGroup,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  S.of(context).markAsUnRead,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  S.of(context).selectAll,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  S.of(context).muteNotification,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 13),
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
