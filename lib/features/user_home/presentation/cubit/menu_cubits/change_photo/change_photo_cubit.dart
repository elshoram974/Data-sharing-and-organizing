import 'package:data_sharing_organizing/core/status/errors/failure.dart';
import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/status/success/success.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/enums/selected_pop_up_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

import '../../../../../auth/domain/entities/auth_user_entity.dart';
import '../../../../domain/entities/upload_file_entity.dart';
import '../../../../domain/repositories/edit_profile_repositories.dart';

part 'change_photo_state.dart';

class ChangePhotoCubit extends Cubit<ChangePhotoState> {
  ChangePhotoCubit(this.editProfileRepo) : super(ChangePhotoInitial());
  final EditProfileRepositories editProfileRepo;
  String? imageLink = ProviderDependency.userMain.user.image;
  http.Client? _client;

  void changeImage(EditPhotoSelectedPopUpItem popupValue) async {
    switch (popupValue) {
      case EditPhotoSelectedPopUpItem.deletePhoto:
        _deleteImage();

      default:
        _changeImage(popupValue);
    }
  }

  void _deleteImage() async {
    if (imageLink == null) return;

    EasyLoading.show();
    emit(const ProgressUploadingPhoto());
    Status<AuthUserEntity> status =
        await editProfileRepo.deleteImage(ProviderDependency.userMain.user.id);
    if (status is Success<AuthUserEntity>) {
      ProviderDependency.userMain.user = status.data;
      imageLink = null;
      emit(ChangePhotoSuccess(imageLink ?? ''));
    } else {
      status as Failure<AuthUserEntity>;
      emit(ChangePhotoFailure(status.error));
      errMessage(status.error);
    }
  }

  void _changeImage(EditPhotoSelectedPopUpItem pickFrom) async {
    final String? imagePath =
        await HandlePickedImage.pickImage(pickFrom.pickFrom());
    if (imagePath == null) return errMessage(S.current.cancel);
    _client = http.Client();
    emit(const ProgressUploadingPhoto());
    final UploadFileEntity uploadedFile = UploadFileEntity(
      user: ProviderDependency.userMain.user,
      filePath: imagePath,
      client: _client!,
      onProgress: (sent, total) => emit(ProgressUploadingPhoto(sent / total)),
    );
    Status<AuthUserEntity> status =
        await editProfileRepo.changeImage(uploadedFile);
    if (status is Success<AuthUserEntity>) {
      ProviderDependency.userMain.user = status.data;
      imageLink = null;
      emit(ChangePhotoSuccess(imageLink ?? ''));
    } else {
      status as Failure<AuthUserEntity>;
      emit(ChangePhotoFailure(status.error));
      errMessage(status.error);
    }
    cancelUploading();
  }

  void cancelUploading() => {_client?.close(), _client = null};

  void errMessage(String error) {
    EasyLoading.showError(error, duration: const Duration(seconds: 5));
  }
}
