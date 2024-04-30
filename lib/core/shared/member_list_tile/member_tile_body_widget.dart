import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';
import '../../utils/styles.dart';

class MemberTileBodyWidget extends StatelessWidget {
  const MemberTileBodyWidget({
    super.key,
    required this.name,
    required this.lastLogin,
  });
  final String name;
  final DateTime lastLogin;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: AppStyle.styleBoldInika24.copyWith(fontSize: 16),
        ),
        const SizedBox(height: 2),
        Text(
          "Last login yesterday at $lastLogin",
          style: AppStyle.styleBoldInika13.copyWith(color: AppColor.gray),
        ),
      ],
    );
  }
}