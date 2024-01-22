import 'package:flutter/material.dart';

import 'auth_logo.dart';
import 'intro_auth_widget.dart';

class AuthLogoWithIntro extends StatelessWidget {
  const AuthLogoWithIntro({
    super.key,
    required this.introHeader,
    required this.introBody,
    this.center = false,
  });

  final String introHeader;
  final String introBody;
  final bool center;

  @override
  Widget build(BuildContext context) {
    CrossAxisAlignment alimentAxis =
        center ? CrossAxisAlignment.center : CrossAxisAlignment.stretch;
    return Column(
      crossAxisAlignment: alimentAxis,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const AuthLogo(),
        IntroAuthWidget(
          header: introHeader,
          body: introBody,
          crossAxisAlignment: alimentAxis,
        ),
      ],
    );
  }
}
