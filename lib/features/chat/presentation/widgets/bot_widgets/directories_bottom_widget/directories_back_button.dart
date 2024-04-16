import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../cubit/bot_cubit/bot_cubit.dart';

class DirectoriesBackButton extends StatelessWidget {
  const DirectoriesBackButton({super.key, required this.botCubit});

  final BOTCubit botCubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (botCubit.currentDirectories.isNotEmpty &&
              botCubit.currentDirectories.first.insideDirectoryId != 0) ||
          botCubit.currentDirectories.isEmpty,
      child: SizedBox(
        height: 38,
        width: double.infinity,
        child: MyFilledButton(
          onPressed: botCubit.closeLastDirectory,
          filledColor: AppColor.active,
          text: S.of(context).back,
          style: AppStyle.styleBoldInika16,
        ),
      ),
    );
  }
}
