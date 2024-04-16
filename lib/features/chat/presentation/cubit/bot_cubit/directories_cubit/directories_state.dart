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

final class ChangeDirectoryBottomHeightState extends DirectoryState {
  const ChangeDirectoryBottomHeightState(this.newHeight);
  final double newHeight;

  @override
  List<double> get props => [newHeight];
}
