import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:flutter/material.dart';

import '../../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../circular_image_widget.dart';
import 'change_image_button.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({super.key, required this.user});

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Stack(
        children: [
          CircularImageWidget(
            imageLink: user.image,
            dimension: 210,
            errorWidget: const PersonImage(),
          ),
          const Positioned(
            bottom: 0,
            right: 16,
            child: ChangeImageButton(),
          )
        ],
      ),
    );
  }
}