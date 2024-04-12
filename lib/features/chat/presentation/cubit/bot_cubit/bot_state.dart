part of 'bot_cubit.dart';

sealed class BotState extends Equatable {
  const BotState();

  @override
  List<Object> get props => [];
}

final class BotInitial extends BotState {
  const BotInitial();
}

final class SetState extends BotState {
  const SetState(this.i);
  final int i;

  @override
  List<int> get props => [i];
}
