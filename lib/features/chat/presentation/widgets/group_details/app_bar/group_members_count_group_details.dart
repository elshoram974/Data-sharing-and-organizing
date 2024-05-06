import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class GroupMembersCountGroupDetails extends StatelessWidget {
  const GroupMembersCountGroupDetails({super.key, required this.membersCount});

  final int? membersCount;

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.sizeOf(context).width;

    return PositionedDirectional(
      top: 180,
      child: SizedBox(
        width: deviceWidth,
        child: Text(
          S.of(context).membersCount(membersCount!),
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}