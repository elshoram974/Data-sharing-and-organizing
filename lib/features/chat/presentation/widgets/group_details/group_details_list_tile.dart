import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
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
  });
  final String title;
  final Widget? leading;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResConstrainedBoxAlign(
        child: ListTile(
          onTap: onTap,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: AppConst.defaultPadding),
          shape: context.isPhoneWidth
              ? RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))
              : null,
          title: Text(
            title,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
          ),
          leadingAndTrailingTextStyle:
              AppStyle.styleBoldInika24.copyWith(fontSize: 20),
          leading: leading,
          trailing: trailing,
        ).topPadding(0.5 * AppConst.defaultPadding),
      ),
    );
  }
}
