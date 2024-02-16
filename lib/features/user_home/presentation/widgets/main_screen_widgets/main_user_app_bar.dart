import 'package:data_sharing_organizing/core/shared/app_logo_Name_home.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MainUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainUserAppBar({super.key, this.hight = 110});
  final double hight;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.defaultPadding,
        vertical: 11,
      ),
      alignment: Alignment.bottomLeft,
      decoration: appBarDecoration(context),
      child: const AppLogoWithNameHome(),
    );
  }

  BoxDecoration appBarDecoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).scaffoldBackgroundColor,
      boxShadow: [
        BoxShadow(
          blurRadius: 4,
          color: Colors.black.withOpacity(0.25),
          offset: const Offset(0, 4),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, AppConst.isWeb ? hight / 2 : hight);
}
