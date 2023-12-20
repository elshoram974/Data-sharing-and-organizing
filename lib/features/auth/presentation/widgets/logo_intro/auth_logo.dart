import 'package:data_sharing_organizing/core/shared/logo_widget.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Container(
        height: MediaQuery.sizeOf(context).shortestSide * 0.2,
        width: MediaQuery.sizeOf(context).shortestSide * 0.3,
        constraints: const BoxConstraints(maxWidth: 400, maxHeight: 300),
        child: Column(
          children: [
            const Expanded(child: FittedBox(child: LogoWidget())),
            Expanded(
              child: FittedBox(
                child: Text(
                  S.of(context).sharikna,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
