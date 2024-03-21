enum GroupType {
  public('public'),
  private('private'),
  organizationOnly('organization_only');

  final String inString;
  const GroupType(this.inString);

  factory GroupType.fromString(String? stringRole) {
    Map<String, GroupType> map = {};
    for (GroupType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? public;
  }
}
