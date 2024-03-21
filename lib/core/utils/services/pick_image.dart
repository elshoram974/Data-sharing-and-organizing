import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../config/locale/generated/l10n.dart';
import 'dependency/locator.dart';

class MyFileData {
  String path;
  late String nameWithoutExt;
  String type;
  String ext;
  Uint8List file;
  MyFileData({
    required this.path,
    required this.type,
    required this.ext,
    required this.file,
  }) {
    nameWithoutExt = ((path.split('/').last.split('.'))..removeLast()).join();
  }
}

final class HandlePickedImage {
  static Future<MyFileData?> pickImage(ImageSource source) async {
    final XFile? image = await sl.get<ImagePicker>().pickImage(source: source);
    if (image == null) return null;
    final String mimeType = image.mimeType ?? 'image/${image.path.split('.').last}';
    final List<String> mime = mimeType.split('/');
    if (mime.first != 'image') return null;

    CroppedFile? croppedFile = await _cropImage(image);

    if (croppedFile == null) return null;
    return MyFileData(
      path: croppedFile.path,
      type: mime.last,
      ext: mime.last,
      file: await croppedFile.readAsBytes(),
    );
  }

  static Future<CroppedFile?> _cropImage(
    XFile image, [
    List<CropAspectRatioPreset>? aspectRatioPresets,
  ]) {
    final List<CropAspectRatioPreset> aspects = [CropAspectRatioPreset.square];
    if (aspectRatioPresets != null) aspects.addAll(aspectRatioPresets);
    return ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatioPresets: aspects,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.current.edit,
          toolbarColor: AppColor.primary,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: AppColor.active,
          lockAspectRatio: aspectRatioPresets == null,
          initAspectRatio: aspectRatioPresets == null
              ? CropAspectRatioPreset.square
              : CropAspectRatioPreset.original,
        ),
        WebUiSettings(
          context: AppRoute.key.currentContext!,
          enableZoom: true,
          enableResize: aspectRatioPresets != null,
          mouseWheelZoom: true,
          showZoomer: true,
          enableExif: true,
          presentStyle: CropperPresentStyle.page,
        ),
      ],
    );
  }
}
