part of 'change_photo_cubit.dart';

sealed class ChangePhotoState extends Equatable {
  const ChangePhotoState();

  @override
  List<Object> get props => [];
}

final class ChangePhotoInitial extends ChangePhotoState {}
