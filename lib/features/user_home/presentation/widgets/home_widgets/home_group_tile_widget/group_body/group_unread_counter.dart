import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GroupUnreadCounter extends StatelessWidget {
  const GroupUnreadCounter({super.key, required this.unReadCounter});

  final int? unReadCounter;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 11.5,
      backgroundColor: AppColor.active,
      child: Text(
        '${unReadCounter == 0 ? '' : unReadCounter}',
        style: AppStyle.styleBoldInika24.copyWith(
          fontSize: 10,
          color: Colors.white,
        ),
      ),
    );
  }
}
