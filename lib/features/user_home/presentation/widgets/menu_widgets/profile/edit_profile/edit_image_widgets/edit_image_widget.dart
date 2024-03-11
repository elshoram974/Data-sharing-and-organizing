import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../../cubit/menu_cubits/change_photo/change_photo_cubit.dart';
import '../../../../circular_image_widget.dart';
import 'change_image_button.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({super.key, required this.user});

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    final ChangePhotoCubit c = BlocProvider.of<ChangePhotoCubit>(context);
    return BlocBuilder<ChangePhotoCubit, ChangePhotoState>(
      builder: (context, state) {
        return Align(
          child: Stack(
            children: [
              CircularImageWidget(
                imageLink: c.imageLink,
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
      },
    );
  }
}
