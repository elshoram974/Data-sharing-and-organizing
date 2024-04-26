import 'package:bubble/bubble.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../../data/models/activity_model.dart';
import '../../../domain/entities/activity_entity.dart';
import '../message_date.dart';

class BotCustomBubble extends StatefulWidget {
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
  State<BotCustomBubble> createState() => _BotCustomBubbleState();
}

class _BotCustomBubbleState extends State<BotCustomBubble> {
  late final bool isTextMessage = widget.message is types.TextMessage;
  late final ActivityEntity? m;
  late final bool canEdit;

  @override
  void initState() async{
    super.initState();
    if (widget.message.metadata?.containsKey("activity") == true) {
      m = await ActivityModel.fromJson(widget.message.metadata!["activity"]);
      canEdit = ProviderDependency.bot.canEditMessage(m!);
    } else {
      m = null;
      canEdit = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isApproved = (m?.isApproved) != false;
    const double border = 5;
    if (!canEdit && !isApproved) return const SizedBox.shrink();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: widget.isTheUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: !widget.isTheUser || !isApproved,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                "${widget.message.author.firstName ?? ''} ${widget.message.author.lastName ?? ''}",
                style: AppStyle.styleBoldInika16.copyWith(fontSize: 10),
              ),
            ),
          ),
          Bubble(
            padding: isTextMessage
                ? const BubbleEdges.all(0)
                : const BubbleEdges.all(border),
            radius: const Radius.circular(0.5 * AppConst.borderRadius),
            color: isApproved
                ? widget.isTheUser
                    ? AppColor.primary
                    : AppColor.grayLightDark(context).withOpacity(0.8)
                : AppColor.background(context).withGreen(100),
            margin: null,
            nip: widget.isTheUser ? BubbleNip.rightTop : BubbleNip.leftTop,
            child: Column(
              children: [
                Visibility(
                  visible: !widget.isTheUser && canEdit,
                  child: Text(
                    S.of(context).doubleTapToEdit,
                    style: AppStyle.styleBoldInika13.copyWith(fontSize: 9),
                  ),
                ),
                Directionality(
                  textDirection: detectRtlDirectionality(
                    isTextMessage
                        ? (widget.message as types.TextMessage).text
                        : 'A',
                  ),
                  child: widget.child,
                ),
              ],
            ),
          ),
          MessageDate(10,
              millisecondsSinceEpoch: widget.message.createdAt ?? 0),
        ],
      ),
    );
  }
}
