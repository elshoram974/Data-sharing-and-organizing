import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeGroupLastMessage extends StatelessWidget {
  const HomeGroupLastMessage({
    super.key,
    this.maxLines = 1,
    required this.lastMessage,
  });

  final int? maxLines;
  final InlineSpan lastMessage;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text.rich(
        lastMessage,
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        style: AppStyle.styleBoldInika24.copyWith(
          fontSize: 13,
          color: AppColor.gray,
        ),
      ),
    );
  }
}
