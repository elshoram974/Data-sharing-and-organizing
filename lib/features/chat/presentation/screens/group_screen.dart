import 'dart:math' as math;

import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/repositories/bot_repo.dart';
import '../../domain/repositories/init_group_repo.dart';
import '../cubit/bot_cubit/bot_cubit.dart';
import '../cubit/chat_cubit/chat_cubit.dart';
import '../cubit/group_cubit/group_cubit.dart';
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
            create: (_) => BOTCubit(sl.get<BOTRepositories>()),
          ),
          BlocProvider<ChatCubit>(
            create: (_) => ChatCubit(),
          ),
        ],
        child: _UserGroupScreen(group: group),
      ),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: const BotFAB(),
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

class BotFAB extends StatelessWidget {
  const BotFAB({super.key});

  @override
  Widget build(BuildContext context) {
    final GroupCubit c = ProviderDependency.group;

    return BlocBuilder<GroupCubit, GroupState>(
      buildWhen: (p, c) => c is GroupChooseScreenState,
      builder: (context, state) {
        return c.currentScreen == 0
            ? ExpandableFab(
                distance: 112,
                children: [
                  ActionButton(
                    onPressed: () => _showAction(context, 0),
                    icon: const Icon(Icons.format_size),
                  ),
                  ActionButton(
                    onPressed: () => _showAction(context, 1),
                    icon: const Icon(Icons.insert_photo),
                  ),
                  ActionButton(
                    onPressed: () => _showAction(context, 2),
                    icon: const Icon(Icons.videocam),
                  ),
                ],
              )
            : const SizedBox.shrink();
      },
    );
  }

  void _showAction(BuildContext context, int index) {
    const actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(actionTitles[index]),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('CLOSE'),
            ),
          ],
        );
      },
    );
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.bottomRight,
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                Icons.close,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = 90.0 / (count - 1);
    for (var i = 0, angleInDegrees = 0.0;
        i < count;
        i++, angleInDegrees += step) {
      children.add(
        _ExpandingActionButton(
          directionInDegrees: angleInDegrees,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            onPressed: _toggle,
            child: const Icon(Icons.create),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * maxDistance,
        );
        return Positioned(
          right: 4.0 + offset.dx,
          bottom: 4.0 + offset.dy,
          child: Transform.rotate(
            angle: (1.0 - progress.value) * math.pi / 2,
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      color: theme.colorScheme.secondary,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

@immutable
class FakeItem extends StatelessWidget {
  const FakeItem({
    super.key,
    required this.isBig,
  });

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: isBig ? 128 : 36,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.grey.shade300,
      ),
    );
  }
}
