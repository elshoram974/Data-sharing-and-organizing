import 'package:data_sharing_organizing/core/shared/responsive/constrained_box.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:data_sharing_organizing/core/utils/services/pick_image.dart';
import 'package:data_sharing_organizing/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GroupNameAndImage extends StatelessWidget {
  const GroupNameAndImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResConstrainedBoxAlign(
        child: Row(
          children: [
            GestureDetector(
              onTap: _changeImage,
              child: const CircleAvatar(
                backgroundColor: AppColor.primary,
                radius: 21,
                child: Icon(
                  size: 24,
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppColor.primary),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  hintStyle: AppStyle.styleBoldInika16,
                  hintText: S.of(context).groupName,
                  constraints: const BoxConstraints(
                    maxWidth: 232,
                    maxHeight: 21,
                  ),
                ),
              ),
            ),
          ],
        ),
      ).horizontalPadding(AppConst.defaultPadding),
    );
  }
}

void _changeImage() async {
  final MyFileData? image =
      await HandlePickedImage.pickImage(ImageSource.gallery);
  if (image == null) return;
  // errMessage(S.current.cancel);
  // emit(const ProgressUploadingPhoto());
  // final UploadFileEntity uploadedFile = UploadFileEntity(
  //   user: ProviderDependency.userMain.user,
  //   file: image,
  // );
  // Status<AuthUserEntity> status =
  //     await editProfileRepo.changeImage(uploadedFile);
  // if (status is Success<AuthUserEntity>) {
  //   ProviderDependency.userMain.user = status.data;
  //   imageLink = status.data.image;
  //   emit(ChangePhotoSuccess(imageLink ?? ''));
  // } else {
  //   status as Failure<AuthUserEntity>;
  //   emit(ChangePhotoFailure(status.failure.message));
  //   errMessage(status.failure.message);
  // }
}
