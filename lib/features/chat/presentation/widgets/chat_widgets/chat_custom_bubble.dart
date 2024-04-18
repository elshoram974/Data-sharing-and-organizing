import 'package:bubble/bubble.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../message_date.dart';

class ChatCustomBubble extends StatelessWidget {
  const ChatCustomBubble({
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
          Bubble(
            padding: isTextMessage
                ? const BubbleEdges.all(0)
                : const BubbleEdges.all(border),
            radius: const Radius.circular(0.5 * AppConst.borderRadius),
            color: isTheUser ? AppColor.primary : AppColor.grayLightDark(context),
            margin: nextMessageInGroup
                ? const BubbleEdges.symmetric(horizontal: 6)
                : null,
            nip: nextMessageInGroup
                ? BubbleNip.no
                : isTheUser
                    ? BubbleNip.rightBottom
                    : BubbleNip.leftBottom,
            child: Directionality(
              textDirection: detectRtlDirectionality(
                isTextMessage ? (message as types.TextMessage).text : 'A',
              ),
              child: child,
            ),
          ),
          MessageDate(6, millisecondsSinceEpoch: message.createdAt ?? 0),
        ],
      ),
    );
  }
}
