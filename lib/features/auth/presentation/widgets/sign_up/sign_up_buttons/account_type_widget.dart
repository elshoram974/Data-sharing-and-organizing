import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
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
  final UserType? group;
  final UserType value;
  final void Function(UserType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<UserType>(
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
