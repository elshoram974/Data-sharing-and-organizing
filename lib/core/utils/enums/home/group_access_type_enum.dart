import 'package:flutter/material.dart';

import '../../config/locale/generated/l10n.dart';
import 'package:hive/hive.dart';


part 'group_access_type_enum.g.dart';

@HiveType(typeId: 11)
enum GroupAccessType {
  @HiveField(0)
  onlyRead('only_read'),
  @HiveField(1)
  readWrite('read_write'),
  @HiveField(2)
  readWriteWithAdminPermission('read_write_with_admin_permission');

  final String inString;
  const GroupAccessType(this.inString);

  factory GroupAccessType.fromString(String? stringRole) {
    Map<String, GroupAccessType> map = {};
    for (GroupAccessType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? readWriteWithAdminPermission;
  }

    String typeName(BuildContext context) {
    Map<GroupAccessType, String> map = {
      onlyRead: S.of(context).readOnly,
      readWrite: S.of(context).readWrite,
      readWriteWithAdminPermission: S.of(context).readWriteWithAdminAgreements,
    };

    return map[this] ?? '';
  }
}
