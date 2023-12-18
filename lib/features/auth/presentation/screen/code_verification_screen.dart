import 'package:flutter/material.dart';

import '../widgets/code_verification/code_verification_body.dart';

class CodeVerificationScreen extends StatelessWidget {
  final String nextRoute;
  const CodeVerificationScreen(this.nextRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CodeVerificationBody(nextRoute));
  }
}
