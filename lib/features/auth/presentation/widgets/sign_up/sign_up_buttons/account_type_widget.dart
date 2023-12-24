import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:flutter/material.dart';

class UserRoleWidget extends StatelessWidget {
  const UserRoleWidget({
    super.key,
    required this.title,
    required this.group,
    required this.value,
    this.onChanged,
  });
  final String title;
  final UserRole? group;
  final UserRole value;
  final void Function(UserRole?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<UserRole>(
      groupValue: group,
      title: Text(title, style: const TextStyle(fontSize: 16)),
      dense: true,
      visualDensity: const VisualDensity(horizontal: -4),
      controlAffinity: ListTileControlAffinity.leading,
      value: value,
      onChanged: onChanged,
    );
  }
}
