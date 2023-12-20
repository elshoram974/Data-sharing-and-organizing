import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
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
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(child: AddWidgetInBody(children: children)),
          const SizedBox(width: AppConst.defaultPadding),
          Expanded(
            child: AuthLogoWithIntro(
              introHeader: introHeader,
              introBody: introBody,
            ),
          ),
        ],
      ),
    );
  }
}