enum GroupAccessType {
  onlyRead('only_read'),
  readWrite('read_write'),
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
}
