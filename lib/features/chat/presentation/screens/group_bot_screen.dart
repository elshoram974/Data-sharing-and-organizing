import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bot_cubit/bot_cubit.dart';
import '../widgets/bot_widgets/bot_chat_widget.dart';
import '../widgets/bot_widgets/directions_bottom_widget.dart';

class GroupBOTScreen extends StatelessWidget {
  const GroupBOTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.bot = BlocProvider.of<BOTCubit>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: ProviderDependency.bot.onPopInvoked,
      child: const Column(
        children: [
          BotChatWidget(),
          DirectionsBottomWidget(),
        ],
      ),
    );
  }
}
