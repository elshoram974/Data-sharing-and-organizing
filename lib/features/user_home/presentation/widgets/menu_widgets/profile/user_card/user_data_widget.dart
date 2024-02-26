import 'package:data_sharing_organizing/core/shared/image/person.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../circular_image_widget.dart';

class UserDataWidget extends StatelessWidget {
  const UserDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AuthUserEntity user = ProviderDependency.userMain.user;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Align(
          child: CircularImageWidget(
            imageLink: '',
            dimension: 110,
            errorWidget: PersonImage(),
          ),
        ),
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