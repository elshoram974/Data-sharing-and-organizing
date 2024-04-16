part of 'bot_cubit.dart';

sealed class BOTState extends Equatable {
  const BOTState();

  @override
  List<Object> get props => [];
}

final class BotInitial extends BOTState {
  const BotInitial();
}

final class SetState extends BOTState {
  const SetState(this.i);
  final int i;

  @override
  List<int> get props => [i];
}

final class OpenDirectoryState extends BOTState {
  const OpenDirectoryState(this.newDirectory);
  final DirectoryEntity newDirectory;

  @override
  List<DirectoryEntity> get props => [newDirectory];
}

final class ChangeDirectoryBottomHeightState extends BOTState {
  const ChangeDirectoryBottomHeightState(this.newHeight);
  final double newHeight;

  @override
  List<double> get props => [newHeight];
}
