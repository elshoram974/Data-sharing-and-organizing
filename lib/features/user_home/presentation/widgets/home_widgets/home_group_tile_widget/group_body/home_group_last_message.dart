import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/enums/message_type/message_type.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show PlaceholderAlignment;

class HomeGroupLastMessage extends StatelessWidget {
  const HomeGroupLastMessage({
    super.key,
    this.maxLines = 1,
    required this.lastMessage,
    required this.lastMessageFrom,
    required this.lastMessageType,
  });

  final int? maxLines;
  final String lastMessage;
  final String lastMessageFrom;
  final MessageType lastMessageType;

  @override
  Widget build(BuildContext context) {
    final IconData? icon = lastMessageType.icon();
    return Expanded(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(text: '$lastMessageFrom:'),
            if (icon != null)
              WidgetSpan(
                alignment: ui.PlaceholderAlignment.middle,
                child: Icon(icon, size: 18, color: AppColor.gray),
              ),
            TextSpan(text: lastMessage),
          ],
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: maxLines,
        textDirection: detectRtlDirectionality(lastMessage),
        style: AppStyle.styleBoldInika24.copyWith(
          fontSize: 13,
          color: AppColor.gray,
        ),
      ),
    );
  }
}
