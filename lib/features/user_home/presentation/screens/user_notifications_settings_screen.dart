import 'package:data_sharing_organizing/core/shared/back_button_leading.dart';
import 'package:flutter/material.dart';

class UserNotificationsSettingsScreen extends StatelessWidget {
  const UserNotificationsSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 100,
        leading: const BackButtonLeading(showBackButton: true),
      ),
    );
  }
}
