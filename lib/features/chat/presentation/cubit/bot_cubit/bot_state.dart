part of 'bot_cubit.dart';

sealed class BotState extends Equatable {
  const BotState();

  @override
  List<Object> get props => [];
}

final class BotInitial extends BotState {
  const BotInitial();
}
