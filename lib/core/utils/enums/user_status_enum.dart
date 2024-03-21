enum UserStatus {
  active('active'),
  inactive('inactive'),
  suspended('suspended'),
  deleted('deleted'),
  pending('pending');

  final String inString;
  const UserStatus(this.inString);

  factory UserStatus.fromString(String? stringRole) {
    Map<String, UserStatus> map = {};
    for (UserStatus e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? active;
  }
}
