import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:data_sharing_organizing/core/shared/image/circular_image_widget.dart';
import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';

class GroupDetailsScreen extends StatelessWidget {
  const GroupDetailsScreen({super.key, required this.group});

  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _CustomSliverAppBarDelegate(group: group),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final GroupHomeEntity group;

  _CustomSliverAppBarDelegate({required this.group});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double percent = shrinkOffset / 215;
    final double openedPercent = 1 - percent;
    final dimension = (openedPercent * 68) + 42;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    final imagePadding = percent * (AppConst.defaultPadding + 93);
    final double customPadding = shrinkOffset >= 110 ? 0 : imagePadding + 48;

    return SizedBox.expand(
      child: Container(
        color: AppColor.active,
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 28,
                left: AppConst.defaultPadding,
                right: AppConst.defaultPadding,
              ),
              width: 77,
              height: 74,
              child: const BackButtonLeading(
                  showBackButton: true, color: Colors.black),
            ),
            PositionedDirectional(
              top: 30,
              start:
                  openedPercent * (deviceWidth - dimension) / 2 + imagePadding,
              child: CircularImageWidget(
                imageLink: group.imageLink,
                dimension: dimension,
                errorWidget: const GroupImage(),
              ),
            ),
            PositionedDirectional(
              top: 30 + (8 + 110) * openedPercent,
              child: Container(
                padding: EdgeInsets.only(
                  right: ProviderDependency.config.isArabic
                      ? imagePadding + 48
                      : customPadding,
                  left: ProviderDependency.config.isArabic
                      ? customPadding
                      : imagePadding + 48,
                ),
                width: deviceWidth,
                alignment: Alignment(
                  ProviderDependency.config.isArabic ? percent : -percent,
                  percent,
                ),
                child: Container(
                  color: Colors.green,
                  child: Text(
                    group.groupName,
                    style: AppStyle.styleBoldInika24.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 215.0;

  @override
  double get minExtent => 76;

  @override
  bool shouldRebuild(_CustomSliverAppBarDelegate oldDelegate) {
    return true;
  }
}
