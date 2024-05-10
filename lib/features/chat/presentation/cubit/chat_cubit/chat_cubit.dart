import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatInitial());

  // final types.User currentUser = MessageAuthor.messageAuthorFromAuth(ProviderDependency.userHome.userMain.user);
}
