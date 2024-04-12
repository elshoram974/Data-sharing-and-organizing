import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bot_state.dart';

class BOTCubit extends Cubit<BotState> {
  BOTCubit() : super(const BotInitial());
}
