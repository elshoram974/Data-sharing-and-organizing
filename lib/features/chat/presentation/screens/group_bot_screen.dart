import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bot_cubit/bot_cubit.dart';
import '../cubit/bot_cubit/directories_cubit/directories_cubit.dart';
import '../widgets/bot_widgets/bot_chat_widget.dart';
import '../widgets/bot_widgets/directories_bottom_widget/directories_bottom_widget.dart';

class GroupBOTScreen extends StatelessWidget {
  const GroupBOTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderDependency.bot = BlocProvider.of<BOTCubit>(context);
    ProviderDependency.directory = BlocProvider.of<DirectoryCubit>(context);
    return PopScope(
      canPop: false,
      onPopInvoked: ProviderDependency.directory.onPopInvoked,
      child: const Column(
        children: [
          BotChatWidget(),
          DirectoriesBottomWidget(),
        ],
      ),
    );
  }
}
