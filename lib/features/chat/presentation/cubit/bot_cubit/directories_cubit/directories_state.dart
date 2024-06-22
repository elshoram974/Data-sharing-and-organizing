part of 'directories_cubit.dart';

sealed class DirectoryState extends Equatable {
  const DirectoryState();

  @override
  List<Object?> get props => [];
}

final class DirectoryInitial extends DirectoryState {
  const DirectoryInitial();
}

final class OpenDirectoryState extends DirectoryState {
  const OpenDirectoryState(this.currentDirectories);
  final List<DirectoryEntity> currentDirectories;

  @override
  List<DirectoryEntity> get props => currentDirectories;
}

final class DeleteDirectoryState extends DirectoryState {
  const DeleteDirectoryState(this.dir);
  final DirectoryEntity dir;

  @override
  List<DirectoryEntity> get props => [dir];
}

final class ChangeDirectoryBottomHeightState extends DirectoryState {
  const ChangeDirectoryBottomHeightState(this.newHeight);
  final double newHeight;

  @override
  List<double> get props => [newHeight];
}

final class ValidateActivityState extends DirectoryState {
  const ValidateActivityState(this.isValid, this.content);
  final bool isValid;
  final String content;

  @override
  List<Object> get props => [isValid, content];
}
