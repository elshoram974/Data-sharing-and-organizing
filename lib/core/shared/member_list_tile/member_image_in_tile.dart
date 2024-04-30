import 'package:flutter/material.dart';

import '../image/circular_image_widget.dart';
import '../../utils/services/dependency/provider_dependency.dart';
import '../image/person.dart';
import '../image/selected_icon.dart';

class MemberImageInTile extends StatelessWidget {
  const MemberImageInTile({
    super.key,
    required this.imageLink,
    this.dimension = 42,
    required this.isSelected,
  });

  final String? imageLink;
  final bool isSelected;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    final bool isArabic = ProviderDependency.config.isArabic;
    return Stack(
      children: [
        CircularImageWidget(
          imageLink: imageLink,
          dimension: dimension,
          errorWidget: const PersonImage(),
        ),
        Positioned(
          bottom: 0,
          right: isArabic ? null : 0,
          left: isArabic ? 0 : null,
          child: SelectedIcon(isSelected: isSelected),
        ),
      ],
    );
  }
}
