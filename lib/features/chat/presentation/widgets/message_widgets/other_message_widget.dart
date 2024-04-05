import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/functions/detect_text_direction.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../user_home/presentation/widgets/circular_image_widget.dart';

class OtherMessageWidget extends StatelessWidget {
  const OtherMessageWidget({
    super.key,
    required this.messageCreator,
    required this.message,
  });
  final AuthUserEntity messageCreator;
  final String message;

  @override
  Widget build(BuildContext context) {
    const double padding = 0.5 * AppConst.defaultPadding;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 38, bottom: 2),
            child: Text(
              messageCreator.name,
              style: AppStyle.styleBoldInika16.copyWith(fontSize: 10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularImageWidget(
                imageLink: messageCreator.image,
                dimension: 32,
                errorWidget: const PersonImage(),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CustomPaint(
                      painter: const OtherMessagePainter(padding),
                      child: Container(
                        padding: const EdgeInsets.only(left: padding),
                        margin:
                            const EdgeInsets.all(0.5 * AppConst.defaultPadding),
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
                    const Text(
                      '1:20',
                      style: TextStyle(fontSize: 8, color: AppColor.gray),
                    ).topPadding(2)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class OtherMessagePainter extends CustomPainter {
  final double padding;
  const OtherMessagePainter(this.padding);
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = AppColor.gray;
    final Path path = Path();
    const double r = 5;
    const Radius radius = Radius.circular(r);
    canvas.drawRRect(
      RRect.fromLTRBAndCorners(
        padding,
        0,
        size.width,
        size.height,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint,
    );
    path.lineTo(padding, 4);
    path.lineTo(padding, size.height - r);
    path.lineTo(size.width - r, size.height - r);
    path.lineTo(size.width - r, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
