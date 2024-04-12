import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class MessageDate extends StatelessWidget {
  const MessageDate(
    this.horizontalPadding, {
    super.key,
    required this.millisecondsSinceEpoch,
  });
  final int millisecondsSinceEpoch;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 2,
      ),
      child: Text(
        intl.DateFormat.jm().format(
          DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch),
        ),
        style: const TextStyle(fontSize: 8, color: AppColor.gray),
      ),
    );
  }
}
