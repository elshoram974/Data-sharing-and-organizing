import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NewGroupAppBar extends StatelessWidget {
  const NewGroupAppBar({super.key, this.subTitle, this.title});

  final String? title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leadingWidth: 100,
      leading: const BackButtonLeading(showBackButton: true),
      elevation: 0,
      scrolledUnderElevation: 0,
      flexibleSpace: SafeArea(
        top: true,
        bottom: true,
        child: FlexibleSpaceBar(
          centerTitle: true,
          background: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title ?? S.of(context).newGroup,
                style: AppStyle.styleBoldInika24.copyWith(fontSize: 36),
              ),
              const SizedBox(height: 10),
              if (subTitle != null)
                Text(
                  subTitle!,
                  style: AppStyle.styleBoldInika24.copyWith(fontSize: 12),
                ),
            ],
          ),
        ),
      ),
      pinned: true,
      floating: true,
      snap: true,
      excludeHeaderSemantics: true,
      expandedHeight: 194,
      backgroundColor: AppColor.background(context),
    );
  }
}
