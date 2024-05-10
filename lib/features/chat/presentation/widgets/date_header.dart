import 'package:bubble/bubble.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/convert_date_to_string.dart';
import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter_chat_ui/src/models/date_header.dart';

class DateHeaderWidget extends StatelessWidget {
  const DateHeaderWidget(this.dateHeader, {super.key});
  final DateHeader dateHeader;

  @override
  Widget build(BuildContext context) {
    return Bubble(
      margin: const BubbleEdges.only(
        top: AppConst.defaultPadding,
        bottom: 0.5 * AppConst.defaultPadding,
      ),
      alignment: Alignment.center,
      nip: BubbleNip.no,
      color: AppColor.grayLightDark(context),
      child: Text(
        DateToString.call(dateHeader.dateTime, true),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 11.0,
          color: Colors.black38,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
