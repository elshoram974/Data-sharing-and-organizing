enum GroupVisibility {
  public('public'),
  private('private'),
  organizationOnly('organization_only');

  final String inString;
  const GroupVisibility(this.inString);

  factory GroupVisibility.fromString(String? stringRole) {
    Map<String, GroupVisibility> map = {};
    for (GroupVisibility e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? public;
  }
}
