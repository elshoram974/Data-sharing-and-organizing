import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonLeading extends StatelessWidget {
  const BackButtonLeading({
    super.key,
    this.color,
    required this.showBackButton,
    this.onWillPop,
  });

  final Color? color;
  final bool showBackButton;
  final void Function()? onWillPop;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showBackButton,
      child: InkWell(
        onTap: onWillPop ?? context.pop,
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.arrow_back_outlined, color: color),
            Text(
              S.of(context).back,
              style: AppStyle.styleBoldInika24.copyWith(fontSize: 20, color: color),
            ),
          ],
        ),
      ),
    );
  }
}
