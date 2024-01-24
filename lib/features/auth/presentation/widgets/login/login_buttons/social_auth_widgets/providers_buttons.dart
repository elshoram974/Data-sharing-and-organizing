import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../cubit/login_cubit/login_provider_view_model.dart';

class ProvidersButtons extends StatelessWidget {
  const ProvidersButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(flex: 5, child: SizedBox()),
        for (LoginProvidersViewModel e in LoginProvidersViewModel.providers) ...[
          const Expanded(child: SizedBox()),
          InkWell(
            onTap: e.onTap,
            child: SizedBox.square(
              dimension: 56,
              child: SvgPicture.asset(
                e.assetName,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
        ],
        const Expanded(flex: 5, child: SizedBox()),
      ],
    );
  }
}