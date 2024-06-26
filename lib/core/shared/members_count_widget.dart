import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MembersCountWidget extends StatelessWidget {
  const MembersCountWidget({
    super.key,
    required this.selectedUsersLength,
    this.topPadding = 0,
    this.bottomPadding = 15,
  });

  final int selectedUsersLength;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
          top: topPadding,
          bottom: bottomPadding,
        ),
        child: ResConstrainedBoxAlign(
          child: SizedBox(
            width: double.maxFinite,
            child: Text(
              S.of(context).membersCount(selectedUsersLength),
              style: AppStyle.styleBoldInika16.copyWith(
                fontSize: 12,
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
