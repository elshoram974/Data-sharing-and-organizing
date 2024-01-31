import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';

import '../widgets/home_user_app_bar.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key, required this.user});
  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeUserAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.defaultPadding,
        ),
        children: [],
      ),
    );
  }
}