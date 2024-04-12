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

final class OpenDirectionState extends BOTState {
  const OpenDirectionState(this.newDirection);
  final DirectionEntity newDirection;

  @override
  List<DirectionEntity> get props => [newDirection];
}
