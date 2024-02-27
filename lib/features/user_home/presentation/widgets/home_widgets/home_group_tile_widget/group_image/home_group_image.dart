import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/group_home_entity.dart';
import '../../../circular_image_widget.dart';
import 'selected_icon.dart';

class HomeGroupImage extends StatelessWidget {
  const HomeGroupImage({
    super.key,
    required this.groupHomeEntity,
    this.dimension = 42,
  });

  final GroupHomeEntity groupHomeEntity;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircularImageWidget(
          imageLink: groupHomeEntity.imageLink,
          dimension: dimension,
          errorWidget: const GroupImage(),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SelectedIcon(isSelected: groupHomeEntity.isSelected),
        ),
      ],
    );
  }
}
