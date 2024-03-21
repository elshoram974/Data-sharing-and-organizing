enum GroupDiscussionType {
  exist('exist'),
  notExist('not_exist'),
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
}
