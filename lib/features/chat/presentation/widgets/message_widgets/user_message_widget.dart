import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

class UserMessageWidget extends StatelessWidget {
  const UserMessageWidget({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    const double padding = 0.5 * AppConst.defaultPadding;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPaint(
            painter: const UserMessagePainter(padding),
            child: Container(
              padding: const EdgeInsets.only(right: padding),
              margin: const EdgeInsets.all(0.5 * AppConst.defaultPadding),
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                message,
                textDirection: detectRtlDirectionality(message),
                style: AppStyle.styleBoldInika16.copyWith(
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 2,
              right: 0.5 * AppConst.defaultPadding,
            ),
            child: Text(
              '1:20',
              style: TextStyle(fontSize: 8, color: AppColor.gray),
            ),
          )
        ],
      ),
    );
  }
}

class UserMessagePainter extends CustomPainter {
  final double padding;
  const UserMessagePainter(this.padding);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColor.primary;
    final Path path = Path();
    const double r = 5;
    const Radius radius = Radius.circular(r);
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        0,
        0,
        size.width - padding,
        size.height,
        topLeft: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint,
    );
    path.moveTo(size.width, 0);
    path.lineTo(size.width - padding, 4);
    path.lineTo(size.width - padding, size.height - r);
    path.lineTo(r, size.height - r);
    path.lineTo(r, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
