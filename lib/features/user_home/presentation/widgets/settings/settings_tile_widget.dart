import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:flutter/material.dart';

class SettingsTileWidget extends StatelessWidget {
  const SettingsTileWidget({
    super.key,
    required this.color,
    required this.style,
    this.onTap,
    required this.icon,
    required this.title,
    required this.trailing,
  });

  final Color? color;
  final TextStyle? style;
  final IconData icon;
  final String title;
  final Widget trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBoxAlign(
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
        shape: context.isPhoneWidth
            ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppConst.borderRadius)),
        leading: Icon(icon, color: color),
        iconColor: color,
        title: Text(title, style: style),
        trailing: trailing,
        onTap: onTap,
      ).bottomPadding(52),
    );
  }
}
