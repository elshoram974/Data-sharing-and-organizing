import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../auth/domain/entities/auth_user_entity.dart';

part 'change_photo_state.dart';

class ChangePhotoCubit extends Cubit<ChangePhotoState> {
  ChangePhotoCubit() : super(ChangePhotoInitial());
  String? imageLink = ProviderDependency.userMain.user.image;

  void changeImage(EditPhotoSelectedPopUpItem value) async {
    switch (value) {
      case EditPhotoSelectedPopUpItem.deletePhoto:
        final user = ProviderDependency.userMain.user;
        imageLink = null;
        ProviderDependency.userMain.user = AuthUserEntity(
          image: null,
          id: user.id,
          name: user.name,
          email: user.email,
          password: user.password,
          userType: user.userType,
        );
        print('image: deletePhoto');

      default:
        final image = await HandlePickedImage.pickImage(value.pickFrom());
        imageLink = image;
        ProviderDependency.userMain.user =
            ProviderDependency.userMain.user.copyWith(image: imageLink);

        print('image: $image');
    }
    emit(ChangePhotoSuccess(imageLink ?? ''));
  }
}
