import 'package:data_sharing_organizing/core/utils/enums/home/group_discussion_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/repositories/bot_repo.dart';
import '../../domain/repositories/init_group_repo.dart';
import '../cubit/bot_cubit/bot_cubit.dart';
import '../cubit/bot_cubit/directories_cubit/directories_cubit.dart';
import '../cubit/chat_cubit/chat_cubit.dart';
import '../cubit/group_cubit/group_cubit.dart';
import '../widgets/bot_widgets/add_data/bot_fab.dart';
import '../widgets/group_app_bar.dart';
import '../widgets/group_floating_button_widget.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityProvider(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GroupCubit>(
            create: (_) => GroupCubit(sl.get<GroupInitRepositories>(), group),
          ),
          BlocProvider<BOTCubit>(
            create: (_) => BOTCubitImp(sl.get<BOTRepositories>()),
          ),
          BlocProvider<DirectoryCubit>(
            create: (_) => DirectoryCubitImp(sl.get<BOTRepositories>()),
          ),
          BlocProvider<ChatCubit>(
            create: (_) => ChatCubit(),
          ),
        ],
        child: const _UserGroupScreen(),
      ),
    );
  }
}

class _UserGroupScreen extends StatelessWidget {
  const _UserGroupScreen();

  @override
  Widget build(BuildContext context) {
    ProviderDependency.group = BlocProvider.of<GroupCubit>(context);
    final GroupCubit c = ProviderDependency.group;
    return Scaffold(
      appBar: const GroupAppBar(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: const BotFAB(),
      body: Stack(
        children: [
          BlocBuilder<GroupCubit, GroupState>(
            buildWhen: (p, c) => c is GroupChooseScreenState,
            builder: (context, state) {
              return screens[c.currentScreen];
            },
          ),
          if (c.group.discussion != GroupDiscussionType.notExist)
            BlocBuilder<GroupCubit, GroupState>(
              buildWhen: (p, c) => c is GroupChangeButtonPlaceState,
              builder: (context, state) {
                return Positioned(
                  left: 0,
                  top: c.top,
                  child: GestureDetector(
                    onTap: c.openFloatingButtonByTap,
                    onHorizontalDragStart: c.onHorizontalDragStart,
                    onHorizontalDragUpdate: c.openFloatingButtonByDrag,
                    onVerticalDragUpdate: (d) => c.onPanUpdate(d, context),
                    child: const GroupFloatingButtonWidget(),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
