import 'package:data_sharing_organizing/core/shared/image/circular_image_widget.dart';
import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import 'back_button_group_details.dart';
import 'group_members_count_group_details.dart';
import 'group_name_group_details.dart';

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final GroupHomeEntity group;
  final int? membersCount;

  CustomSliverAppBarDelegate({this.membersCount, required this.group});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double percent = shrinkOffset / 215;
    final double openedPercent = 1 - percent;
    final double dimension = (openedPercent * 68) + 42;
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    final double imagePadding = percent * (AppConst.defaultPadding + 93);
    final double customPadding = shrinkOffset >= 110 ? 0 : imagePadding + 48;

    return SizedBox.expand(
      child: ColoredBox(
        color: AppColor.active,
        child: SafeArea(
          child: Stack(
            children: [
              const BackButtonGroupDetails(),
              PositionedDirectional(
                top: 5,
                start: openedPercent * (deviceWidth - dimension) / 2 +
                    imagePadding,
                child: CircularImageWidget(
                  imageLink: group.imageLink,
                  dimension: dimension,
                  errorWidget: const GroupImage(),
                ),
              ),
              GroupNameGroupDetails(
                openedPercent: openedPercent,
                imagePadding: imagePadding,
                customPadding: customPadding,
                deviceWidth: deviceWidth,
                percent: percent,
                group: group,
              ),
              if (membersCount != null)
                GroupMembersCountGroupDetails(membersCount: membersCount),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 215.0;

  @override
  double get minExtent => 76;

  @override
  bool shouldRebuild(CustomSliverAppBarDelegate oldDelegate) {
    return false;
  }
}
