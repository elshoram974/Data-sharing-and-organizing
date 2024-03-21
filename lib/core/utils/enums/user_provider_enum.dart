enum UserProvider {
  facebook('facebook'),
  google('google'),
  emailPassword('email_password');

  final String inString;
  const UserProvider(this.inString);

  factory UserProvider.fromString(String? stringRole) {
    Map<String, UserProvider> map = {};
    for (UserProvider e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? emailPassword;
  }
}
