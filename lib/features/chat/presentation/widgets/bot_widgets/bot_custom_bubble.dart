import 'package:bubble/bubble.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../message_date.dart';

class BotCustomBubble extends StatelessWidget {
  const BotCustomBubble({
    super.key,
    required this.isTheUser,
    required this.message,
    required this.nextMessageInGroup,
    required this.child,
  });
  final Widget child;
  final types.Message message;
  final bool isTheUser;
  final bool nextMessageInGroup;

  @override
  Widget build(BuildContext context) {
    final bool isTextMessage = message is types.TextMessage;
    const double border = 5;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment:
            isTheUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !isTheUser,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                message.author.firstName.toString(),
                style: AppStyle.styleBoldInika16.copyWith(fontSize: 10),
              ),
            ),
          ),
          Bubble(
            padding: isTextMessage
                ? const BubbleEdges.all(0)
                : const BubbleEdges.all(border),
            radius: const Radius.circular(0.5 * AppConst.borderRadius),
            color:
                isTheUser ? AppColor.primary : AppColor.grayLightDark(context),
            margin: null,
            nip: isTheUser ? BubbleNip.rightTop : BubbleNip.leftTop,
            child: Directionality(
              textDirection: detectRtlDirectionality(
                isTextMessage ? (message as types.TextMessage).text : 'A',
              ),
              child: child,
            ),
          ),
          MessageDate(10, millisecondsSinceEpoch: message.createdAt ?? 0),
        ],
      ),
    );
  }
}