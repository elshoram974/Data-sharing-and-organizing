import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../cubit/group_cubit/group_cubit.dart';
import '../widgets/group_app_bar.dart';
import '../widgets/group_floating_button_widget.dart';

class UserGroupScreen extends StatelessWidget {
  const UserGroupScreen({super.key, required this.group});
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GroupCubit(),
      child: _UserGroupScreen(group: group),
    );
  }
}

class _UserGroupScreen extends StatelessWidget {
  const _UserGroupScreen({required this.group});
  final GroupHomeEntity group;

  @override
  Widget build(BuildContext context) {
    ProviderDependency.group = BlocProvider.of<GroupCubit>(context);
    final GroupCubit c = ProviderDependency.group;
    return Scaffold(
      appBar: GroupAppBar(group: group),
      body: Stack(
        children: [
          BlocBuilder<GroupCubit, GroupState>(
            buildWhen: (p, c) => c is GroupChooseScreenState,
            builder: (context, state) {
              return screens[c.currentScreen];
            },
          ),
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
                  onPanUpdate: (d) => c.onPanUpdate(d, context),
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
