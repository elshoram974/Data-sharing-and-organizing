import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/extension/padding_ex.dart';
import 'package:flutter/material.dart';

import 'auth_app_bar/auth_app_bar.dart';
import 'auth_body/auth_response_body.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({
    super.key,
    required this.introHeader,
    required this.introBody,
    this.children = const <Widget>[],
    this.showSettingsButton = true,
    this.showBackButton = true,
    this.onWillPop,
  });

  final String introHeader;
  final String introBody;
  final bool showSettingsButton;
  final bool showBackButton;
  final void Function()? onWillPop;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PopScope(
        canPop: onWillPop == null,
        onPopInvoked: (_) => {if (!_ && onWillPop != null) onWillPop!()},
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            AuthAppBar(
              showBackButton: showBackButton,
              onWillPop: onWillPop,
              showSettingsButton: showSettingsButton,
            ),
            AuthResponseBody(
              introHeader: introHeader,
              introBody: introBody,
              children: children,
            )
          ],
        ).horizontalPadding(AppConst.defaultPadding),
      ),
    );
  }
}
