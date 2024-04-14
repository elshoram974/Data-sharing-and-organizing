import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../utils/constants/app_color.dart';

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
    this.showInCurveDesign = false,
    required this.degreeStart,
    required this.fab,
  });

  final bool? initialOpen;
  final bool showInCurveDesign;
  final double degreeStart;
  final double distance;
  final List<Widget> children;
  final FloatingActionButton fab;

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
          if (_open)
            GestureDetector(
              onTap: _toggle,
              child: Container(color: Colors.transparent),
            ),
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return AnimatedContainer(
      transformAlignment: Alignment.center,
      transform: Matrix4.diagonal3Values(
        _open ? 1.0 : 0.5,
        _open ? 1.0 : 0.5,
        1.0,
      ),
      duration: const Duration(milliseconds: 250),
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          color: AppColor.active,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(Icons.close, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    if (widget.showInCurveDesign) {
      final step = 90.0 / (count - 1);
      double angleInDegrees = widget.degreeStart;

      for (int i = 0; i < count; i++, angleInDegrees += step) {
        children.add(
          _ExpandingActionButton(
            directionInDegrees: angleInDegrees,
            distance: widget.distance,
            progress: _expandAnimation,
            child: widget.children[i],
          ),
        );
      }
    } else {
      final double step = widget.distance;
      double distance = 0;

      for (int i = 0; i < count; i++) {
        distance += step;
        children.add(
          _ExpandingActionButton(
            directionInDegrees: widget.degreeStart,
            distance: distance,
            progress: _expandAnimation,
            child: widget.children[i],
          ),
        );
      }
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return Positioned(
      bottom: 4,
      right: 4,
      child: IgnorePointer(
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
              autofocus: widget.fab.autofocus,
              backgroundColor: widget.fab.backgroundColor,
              clipBehavior: widget.fab.clipBehavior,
              disabledElevation: widget.fab.disabledElevation,
              elevation: widget.fab.elevation,
              enableFeedback: widget.fab.enableFeedback,
              focusColor: widget.fab.focusColor,
              focusElevation: widget.fab.focusElevation,
              focusNode: widget.fab.focusNode,
              foregroundColor: widget.fab.foregroundColor,
              heroTag: widget.fab.heroTag,
              highlightElevation: widget.fab.highlightElevation,
              hoverColor: widget.fab.hoverColor,
              hoverElevation: widget.fab.hoverElevation,
              isExtended: widget.fab.isExtended,
              key: widget.fab.key,
              materialTapTargetSize: widget.fab.materialTapTargetSize,
              mini: widget.fab.mini,
              mouseCursor: widget.fab.mouseCursor,
              shape: widget.fab.shape,
              splashColor: widget.fab.splashColor,
              tooltip: widget.fab.tooltip,
              child: widget.fab.child,
            ),
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
    required this.distance,
    required this.progress,
    required this.child,
  });

  final double directionInDegrees;
  final double distance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        final offset = Offset.fromDirection(
          directionInDegrees * (math.pi / 180.0),
          progress.value * distance,
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
    this.tooltip,
    required this.icon,
  });

  final void Function()? onPressed;
  final Widget icon;
  final String? tooltip;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      style: IconButton.styleFrom(
        backgroundColor: theme.colorScheme.secondary,
        elevation: 4,
      ),
      tooltip: tooltip,
      color: theme.colorScheme.onSecondary,
    );
  }
}
