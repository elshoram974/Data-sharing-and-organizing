import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:flutter/material.dart';

class UserHomeScreen extends StatelessWidget {
  const UserHomeScreen({super.key, required this.user});
  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(user.email),
    );
  }
}
