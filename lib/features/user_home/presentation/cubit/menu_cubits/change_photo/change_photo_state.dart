part of 'change_photo_cubit.dart';

sealed class ChangePhotoState extends Equatable {
  const ChangePhotoState();

  @override
  List<Object> get props => [];
}

final class ChangePhotoInitial extends ChangePhotoState {}

final class ProgressUploadingPhoto extends ChangePhotoState {
  const ProgressUploadingPhoto([this.value]);
  final double? value;

  @override
  List<Object> get props => [value ?? 0.0];
}

final class ChangePhotoSuccess extends ChangePhotoState {
  const ChangePhotoSuccess(this.imageLink);
  final String imageLink;

  @override
  List<Object> get props => [imageLink];
}

final class ChangePhotoFailure extends ChangePhotoState {
  const ChangePhotoFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
