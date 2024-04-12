import 'package:data_sharing_organizing/core/shared/filled_button.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../cubit/bot_cubit/bot_cubit.dart';

class DirectionsBackButton extends StatelessWidget {
  const DirectionsBackButton({super.key, required this.botCubit});

  final BOTCubit botCubit;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: (botCubit.currentDirections.isNotEmpty &&
              botCubit.currentDirections.first.insideDirectionId != 0) ||
          botCubit.currentDirections.isEmpty,
      child: SizedBox(
        height: 38,
        width: double.infinity,
        child: MyFilledButton(
          onPressed: botCubit.closeLastDirection,
          filledColor: AppColor.active,
          text: S.of(context).back,
          style: AppStyle.styleBoldInika16,
        ),
      ),
    );
  }
}
