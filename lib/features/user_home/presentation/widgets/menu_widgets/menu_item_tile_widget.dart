import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });
  final IconData icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
      shape: const RoundedRectangleBorder(side: BorderSide.none),
      onTap: onTap,
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.primary,
            radius: 21,
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: AppConst.defaultPadding),
          Text(
            title,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios)
        ],
      ),
    ).verticalPadding(AppConst.defaultPadding);
  }
}
