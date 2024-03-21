enum GroupStatus {
  active('active'),
  inactive('inactive'),
  suspended('suspended'),
  deleted('deleted'),
  pending('pending');

  final String inString;
  const GroupStatus(this.inString);

  factory GroupStatus.fromString(String? stringRole) {
    Map<String, GroupStatus> map = {};
    for (GroupStatus e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? active;
  }
}
