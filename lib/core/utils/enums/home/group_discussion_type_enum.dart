import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../config/locale/generated/l10n.dart';

part 'group_discussion_type_enum.g.dart';

@HiveType(typeId: 5)
enum GroupDiscussionType {
  @HiveField(0)
  exist('exist'),
  @HiveField(1)
  notExist('not_exist'),
  @HiveField(2)
  existButClosed('exist_but_closed');

  final String inString;
  const GroupDiscussionType(this.inString);

  factory GroupDiscussionType.fromString(String? stringRole) {
    Map<String, GroupDiscussionType> map = {};
    for (GroupDiscussionType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? notExist;
  }

  String typeName(BuildContext context) {
    Map<GroupDiscussionType, String> map = {
      exist: S.of(context).exist,
      notExist: S.of(context).notExist,
      existButClosed: S.of(context).existButClosed,
    };

    return map[this] ?? '';
  }
}
