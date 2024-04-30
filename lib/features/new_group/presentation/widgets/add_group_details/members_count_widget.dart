import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class MembersCountWidget extends StatelessWidget {
  const MembersCountWidget({super.key, required this.selectedUsers});

  final List selectedUsers;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
          left: AppConst.defaultPadding,
          right: AppConst.defaultPadding,
          bottom: 15,
        ),
        child: ResConstrainedBoxAlign(
          child: SizedBox(
            width: double.maxFinite,
            child: Text(
              S.of(context).membersCount(selectedUsers.length),
              style: AppStyle.styleBoldInika16.copyWith(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
