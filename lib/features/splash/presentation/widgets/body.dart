import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:data_sharing_organizing/core/utils/config/routes/routes.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/provider_dependency.dart';
import 'package:data_sharing_organizing/features/splash/presentation/cubit/config_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'animated_logo.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  final ConfigCubit cubit = ProviderDependency.config;

  @override
  void initState() {
    super.initState();
    startScaleAnimation();
    navigateHomeScreen();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double logoSize = MediaQuery.sizeOf(context).shortestSide * 0.397;
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedLogo(animation: _animation, logoSize: logoSize),
          Text(
            S.of(context).sharikna,
            style: TextStyle(
              fontSize: logoSize / 3.402857,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  void startScaleAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceOut,
    );

    _controller.forward();
  }

  Future<void> navigateHomeScreen() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        if (cubit.isLoggedIn) {
          if (cubit.currentUser!.userType == UserType.business) {
            // TODO: to admin home
          } else {
            context.go(AppRoute.userHome, extra: cubit.currentUser!);
          }
        } else {
          context.go(AppRoute.login);
        }
      },
    );
  }
}
