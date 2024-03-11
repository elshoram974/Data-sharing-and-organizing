import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image/pick_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_photo_state.dart';

class ChangePhotoCubit extends Cubit<ChangePhotoState> {
  ChangePhotoCubit() : super(ChangePhotoInitial());
  String? imageLink = ProviderDependency.userMain.user.image;

  void changeImage(EditPhotoSelectedPopUpItem value) async {
    switch (value) {
      case EditPhotoSelectedPopUpItem.deletePhoto:
      // TODO: Handle this case.

      default:
        final image = await HandlePickedImage.pickImage(value.pickFrom());
        print('image: $image');
    }
  }
}
