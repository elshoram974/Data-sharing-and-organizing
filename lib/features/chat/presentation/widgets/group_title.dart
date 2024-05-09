import 'package:data_sharing_organizing/core/shared/image/circular_image_widget.dart';
import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';

class GroupTitle extends StatelessWidget {
  const GroupTitle({
    super.key,
    required this.group,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  final GroupHomeEntity group;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        CircularImageWidget(
          imageLink: group.imageLink,
          dimension: 42,
          errorWidget: const GroupImage(),
        ),
        const SizedBox(width: .5 * AppConst.defaultPadding),
        Text(
          group.groupName,
          style: AppStyle.styleBoldInika24.copyWith(fontSize: 20),
        ),
      ],
    );
  }
}
