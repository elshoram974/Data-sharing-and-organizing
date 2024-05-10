import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
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
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            name,
            style: AppStyle.styleBoldInika24.copyWith(fontSize: 16),
          ),
        ),
        const SizedBox(height: 2),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            S
                .of(context)
                .lastLoginDateString(DateToString.lastLoginText(lastLogin)),
            style: AppStyle.styleBoldInika13.copyWith(color: AppColor.gray),
          ),
        ),
      ],
    );
  }
}
