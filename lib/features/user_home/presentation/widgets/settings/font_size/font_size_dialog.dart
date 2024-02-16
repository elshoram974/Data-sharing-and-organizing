import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'font_scale_slider.dart';

class FontSizeDialog extends StatelessWidget {
  const FontSizeDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return ResConstrainedBox(
      maxWidthNotPhone: AppConst.dialogConstraint,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppConst.defaultPadding),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('A', style: AppStyle.styleBoldInika24.copyWith(fontSize: 10)),
            const FontScaleSlider(),
            Text('A', style: AppStyle.styleBoldInika24.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
