import 'package:flutter/material.dart';

import '../logo_intro/auth_logo_with_intro.dart';
import 'add_widget_in_body.dart';

class AuthDesktopBody extends StatelessWidget {
  const AuthDesktopBody({
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
    const int flex = 20;
    return SliverToBoxAdapter(
      child: Row(
        children: [
          const Spacer(),
          Expanded(
            flex: flex,
            child: AuthLogoWithIntro(
              introHeader: introHeader,
              introBody: introBody,
              center: true,
            ),
          ),
          const Spacer(),
          Expanded(flex: flex, child: AddWidgetInBody(children: children)),
          const Spacer(),
        ],
      ),
    );
  }
}
