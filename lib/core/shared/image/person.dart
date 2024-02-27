import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_assets.dart';

class PersonImage extends StatelessWidget {
  const PersonImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppAssets.person,
      fit: BoxFit.cover,
      alignment: Alignment.topCenter,
    );
  }
}
