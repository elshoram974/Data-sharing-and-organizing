import 'package:flutter/material.dart';

import 'auth_logo.dart';
import 'intro_auth_widget.dart';

class AuthLogoWithIntro extends StatelessWidget {
  const AuthLogoWithIntro({
    super.key,
    required this.introHeader,
    required this.introBody,
  });

  final String introHeader;
  final String introBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const AuthLogo(),
        IntroAuthWidget(
          header: introHeader,
          body: introBody,
        ),
      ],
    );
  }
}
