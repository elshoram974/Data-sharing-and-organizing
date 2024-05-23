import 'package:data_sharing_organizing/core/shared/image/open_image/open_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/responsive_ex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';

class MediaWidget extends StatelessWidget {
  const MediaWidget(this.images, {super.key});
  final List<ImageMessage> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(AppConst.defaultPadding),
      itemCount: images.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktopWidth
            ? 12
            : context.isTabletWidth
                ? 6
                : 3,
        mainAxisSpacing: 0.5 * AppConst.defaultPadding,
        crossAxisSpacing: AppConst.defaultPadding,
      ),
      itemBuilder: (context, i) {
        return OpenImage(
          imageLink: images[i].uri,
          errorWidget: const Icon(Icons.error_outline, color: Colors.red),
        );
      },
    );
  }
}
