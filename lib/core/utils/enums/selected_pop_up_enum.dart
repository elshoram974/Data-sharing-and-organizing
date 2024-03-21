import 'package:image_picker/image_picker.dart';

enum HomeSelectedPopUpItem {
  exitGroup,
  markAsUnRead,
  selectAll,
  deselectAll,
  muteNotification,
  unmuteNotification
}

enum EditPhotoSelectedPopUpItem {
  openCamera,
  openGallery,
  openFiles,
  deletePhoto;

  ImageSource pickFrom() {
    switch (this) {
      case openCamera:
        return ImageSource.camera;
      default:
        return ImageSource.gallery;
    }
  }
}
