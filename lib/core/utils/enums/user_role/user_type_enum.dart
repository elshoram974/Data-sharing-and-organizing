import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../config/locale/generated/l10n.dart';

part 'user_type_enum.g.dart';

@HiveType(typeId: 1)
enum UserType {
  @HiveField(0)
  personal('personal'),
  @HiveField(1)
  business('business');

  final String inString;
  const UserType(this.inString);

  factory UserType.fromString(String? stringRole) {
    Map<String, UserType> map = {};
    for (UserType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? personal;
  }

  String name(BuildContext context) {
    switch (this) {
      case business:
        return S.of(context).businessAccount;
      case personal:
        return S.of(context).personalAccount;
    }
  }
}
