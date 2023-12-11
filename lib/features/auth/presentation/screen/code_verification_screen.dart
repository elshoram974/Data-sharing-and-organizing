import 'package:flutter/material.dart';

import '../widgets/code_verification/code_verification_body.dart';


class CodeVerificationScreen extends StatelessWidget {
  const CodeVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: CodeVerificationBody());
  }
}
