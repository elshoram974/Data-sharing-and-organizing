import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

class BottomSliderButton extends StatelessWidget {
  const BottomSliderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (d) => ProviderDependency.bot.changeHeight(d, context),
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: const EdgeInsets.all(0.5 * AppConst.defaultPadding),
        color: AppColor.background(context),
        child: Container(
          width: 80,
          height: 12,
          decoration: BoxDecoration(
            color: AppColor.active,
            borderRadius: BorderRadius.circular(AppConst.borderRadius),
          ),
        ),
      ),
    );
  }
}