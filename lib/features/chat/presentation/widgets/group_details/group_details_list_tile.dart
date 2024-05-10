import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GroupDetailsListTile extends StatelessWidget {
  const GroupDetailsListTile({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.color,
    this.padding,
  });
  final String title;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: padding ??
            const EdgeInsets.only(top: 0.5 * AppConst.defaultPadding),
        child: ResConstrainedBoxAlign(
          child: ListTile(
            onTap: onTap,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
            shape: context.isPhoneWidth
                ? const RoundedRectangleBorder(borderRadius: BorderRadius.zero)
                : null,
            title: Text(
              title,
              style: AppStyle.styleBoldInika24.copyWith(
                fontSize: 20,
                color: color,
              ),
            ),
            leadingAndTrailingTextStyle: AppStyle.styleBoldInika24.copyWith(
              fontSize: 20,
              color: color,
            ),
            leading: leading,
            trailing: trailing,
          ),
        ),
      ),
    );
  }
}
