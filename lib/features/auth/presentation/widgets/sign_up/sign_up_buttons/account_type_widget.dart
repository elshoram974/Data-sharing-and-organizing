import 'package:data_sharing_organizing/core/utils/enums/account_type_enum.dart';
import 'package:flutter/material.dart';

class AccountTypeWidget extends StatelessWidget {
  const AccountTypeWidget({
    super.key,
    required this.title,
    required this.group,
    required this.value,
    this.onChanged,
  });
  final String title;
  final AccountType? group;
  final AccountType value;
  final void Function(AccountType?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return RadioListTile<AccountType>(
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
