import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class NameAndArrowWidget extends StatelessWidget {
  const NameAndArrowWidget({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            name,
            style: AppStyle.styleBoldInika16.copyWith(height: 0.9),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: AppConst.defaultPadding),
        const Icon(Icons.arrow_forward_ios),
      ],
    );
  }
}
