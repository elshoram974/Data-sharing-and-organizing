import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../cubit/bot_cubit/directories_cubit/directories_cubit.dart';

class DirectoriesBackButton extends StatelessWidget {
  const DirectoriesBackButton({super.key, required this.cubit});

  final DirectoryCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: cubit.canDirectoryPop,
      replacement: const SizedBox(height: 0, width: double.maxFinite),
      child: SizedBox(
        height: 38,
        width: double.infinity,
        child: MyFilledButton(
          onPressed: cubit.closeLastDirectory,
          filledColor: AppColor.active,
          text: S.of(context).back,
          style: AppStyle.styleBoldInika16,
        ),
      ),
    );
  }
}
