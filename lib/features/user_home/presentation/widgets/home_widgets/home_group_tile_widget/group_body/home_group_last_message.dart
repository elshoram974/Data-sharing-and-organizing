import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeGroupLastMessage extends StatelessWidget {
  const HomeGroupLastMessage({super.key, required this.lastMessage});

  final InlineSpan lastMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: AppStyle.styleBoldInika24.copyWith(
          fontSize: 13,
          color: AppColor.gray,
        ),
      ),
    );
  }
}
