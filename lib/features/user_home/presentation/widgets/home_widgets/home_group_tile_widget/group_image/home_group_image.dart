import 'package:data_sharing_organizing/core/shared/image/group.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/entities/group_home_entity.dart';
import '../../../../../../../core/shared/image/circular_image_widget.dart';
import '../../../../../../../core/shared/image/selected_icon.dart';

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
    final bool isArabic = ProviderDependency.config.isArabic;
    return Stack(
      children: [
        CircularImageWidget(
          imageLink: groupHomeEntity.imageLink,
          dimension: dimension,
          errorWidget: const GroupImage(),
        ),
        Positioned(
          bottom: 0,
          right: isArabic ? null : 0,
          left: isArabic ? 0 : null,
          child: SelectedIcon(isSelected: groupHomeEntity.isSelected),
        ),
      ],
    );
  }
}
