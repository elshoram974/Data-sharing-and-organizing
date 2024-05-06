import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';

class GroupNameGroupDetails extends StatelessWidget {
  const GroupNameGroupDetails({
    super.key,
    required this.openedPercent,
    required this.imagePadding,
    required this.customPadding,
    required this.deviceWidth,
    required this.percent,
    required this.group,
  });

  final double openedPercent;
  final double imagePadding;
  final double customPadding;
  final double deviceWidth;
  final double percent;
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: 3 + 118 * openedPercent,
      child: Container(
        height: 38,
        padding: EdgeInsets.only(
          right: ProviderDependency.config.isArabic
              ? imagePadding + 55
              : customPadding,
          left: ProviderDependency.config.isArabic
              ? customPadding
              : imagePadding + 55,
        ),
        width: deviceWidth,
        alignment: Alignment(
          ProviderDependency.config.isArabic ? percent : -percent,
          percent,
        ),
        child: Text(
          group.groupName,
          style: AppStyle.styleBoldInika24.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
