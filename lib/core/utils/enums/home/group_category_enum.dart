enum GroupCategory {
  personal('personal'),
  pending('business');

  final String inString;
  const GroupCategory(this.inString);

  factory GroupCategory.fromString(String? stringRole) {
    Map<String, GroupCategory> map = {};
    for (GroupCategory e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? personal;
  }
}
