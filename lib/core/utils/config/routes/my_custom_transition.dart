import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract final class MyCustomTransition {
  static CustomTransitionPage slideTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
    required Offset offset,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
        position: animation.drive(
          Tween<Offset>(
            begin: offset,
            end: Offset.zero,
          ).chain(
            CurveTween(curve: Curves.easeInOut),
          ),
        ),
        child: child,
      ),
    );
  }
}
