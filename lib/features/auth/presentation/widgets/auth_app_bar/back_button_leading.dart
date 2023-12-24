import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BackButtonLeading extends StatelessWidget {
  const BackButtonLeading({super.key, required this.showBackButton});

  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showBackButton,
      child: InkWell(
        onTap: context.pop,
        borderRadius: BorderRadius.circular(AppConst.borderRadius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.arrow_back_outlined),
            Text(S.of(context).back, style: AppStyle.styleBold20),
          ],
        ),

        // icon: const Icon(Icons.settings_outlined),
      ),
    );
  }
}
