import 'package:flutter/material.dart';

import '../logo_intro/auth_logo_with_intro.dart';
import 'add_widget_in_body.dart';

class AuthPhoneAndTabletBody extends StatelessWidget {
  const AuthPhoneAndTabletBody({
    super.key,
    required this.introHeader,
    required this.introBody,
    required this.children,
  });

  final String introHeader;
  final String introBody;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AddWidgetInBody(
        children: [
          AuthLogoWithIntro(introHeader: introHeader, introBody: introBody),
          ...children,
        ],
      ),
    );
  }
}
