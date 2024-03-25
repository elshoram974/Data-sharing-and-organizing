import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../cubit/menu_cubits/change_photo/change_photo_cubit.dart';
import '../../../circular_image_widget.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthUserEntity user = ProviderDependency.userMain.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _ImageInCard(),
        Text(
          user.name,
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika24.copyWith(color: Colors.white),
        ),
        Text(
          user.email,
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(color: Colors.white),
        ),
        Text(
          user.userType.name(context),
          textAlign: TextAlign.center,
          style: AppStyle.styleBoldInika16.copyWith(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

class _ImageInCard extends StatelessWidget {
  const _ImageInCard();

  @override
  Widget build(BuildContext context) {
    final ChangePhotoCubit c = BlocProvider.of<ChangePhotoCubit>(context);

    c.imageLink = ProviderDependency.userMain.user.image;

    return BlocBuilder<ChangePhotoCubit, ChangePhotoState>(
      builder: (context, state) {
        return Align(
          child: CircularImageWidget(
            imageLink: c.imageLink,
            dimension: 110,
            errorWidget: const PersonImage(),
          ),
        );
      },
    );
  }
}
