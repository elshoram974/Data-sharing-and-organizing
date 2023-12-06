import 'package:data_sharing_organizing/core/shared/logo_widget.dart';
import 'package:data_sharing_organizing/core/utils/config/locale/generated/l10n.dart';
import 'package:flutter/material.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        width: 100,
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
