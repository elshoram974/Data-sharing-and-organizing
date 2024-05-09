import 'package:data_sharing_organizing/core/shared/image/circular_image_widget.dart';
import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../user_home/domain/entities/group_home_entity.dart';
import 'back_button_group_details.dart';
import 'group_members_count_group_details.dart';

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
    final bool isClosed = openedPercent <= 0.6;

    return SizedBox.expand(
      child: ColoredBox(
        color: AppColor.active,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const BackButtonGroupDetails(),
                    Expanded(
                      child: _GroupImageAndName(
                        group: group,
                        dimension: dimension,
                        isClosed: isClosed,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isClosed) ...[
                _GroupName(group: group),
                if (membersCount != null)
                  _MembersCount(membersCount: membersCount)
              ]
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

class _GroupImageAndName extends StatelessWidget {
  const _GroupImageAndName({
    required this.group,
    required this.dimension,
    required this.isClosed,
  });

  final GroupHomeEntity group;
  final double dimension;
  final bool isClosed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularImageWidget(
            imageLink: group.imageLink,
            dimension: dimension,
            errorWidget: const GroupImage(),
          ),
          if (isClosed)
            Expanded(
              child: Text(
                group.groupName,
                overflow: TextOverflow.fade,
                style: AppStyle.styleBoldInika24.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          if (!isClosed)
            const SizedBox(width: 77 + 2 * AppConst.defaultPadding),
        ],
      ),
    );
  }
}

class _GroupName extends StatelessWidget {
  const _GroupName({required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          group.groupName,
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika24.copyWith(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class _MembersCount extends StatelessWidget {
  const _MembersCount({required this.membersCount});

  final int? membersCount;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: GroupMembersCountGroupDetails(
          membersCount: membersCount,
        ),
      ),
    );
  }
}
