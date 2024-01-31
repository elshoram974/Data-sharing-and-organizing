import 'package:data_sharing_organizing/core/shared/app_logo_Name_home.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

class HomeUserAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeUserAppBar({super.key});

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
  Size get preferredSize => const Size(double.maxFinite, 110);
}