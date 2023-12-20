import 'package:data_sharing_organizing/core/shared/responsive/in_many_device.dart';
import 'package:flutter/material.dart';

import 'desktop_body.dart';
import 'phone_tablet_body.dart';

class AuthResponseBody extends StatelessWidget {
  const AuthResponseBody({
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
    return InManyDevice(
      phone: phoneAndTablets(),
      tablet: phoneAndTablets(),
      desktop: desktop(),
    );
  }

  AuthDesktopBody desktop() {
    return AuthDesktopBody(
      introHeader: introHeader,
      introBody: introBody,
      children: children,
    );
  }

  AuthPhoneAndTabletBody phoneAndTablets() {
    return AuthPhoneAndTabletBody(
      introHeader: introHeader,
      introBody: introBody,
      children: children,
    );
  }
}
