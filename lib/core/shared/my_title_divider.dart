import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import '../utils/constants/app_constants.dart';
import '../utils/styles.dart';

class MyTitleDivider extends StatelessWidget {
  const MyTitleDivider({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: AppStyle.styleRegular15.color)),
        Text(title, style: AppStyle.styleRegular15)
            .horizontalPadding(AppConst.defaultPadding / 2),
        Expanded(child: Divider(color: AppStyle.styleRegular15.color)),
      ],
    );
  }
}
