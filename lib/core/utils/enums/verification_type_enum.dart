enum VerificationType {
  createEmail('create_email'),
  forgotPassword('forgot_password');

  final String inString;
  const VerificationType(this.inString);

  factory VerificationType.fromString(String? stringRole) {
    Map<String, VerificationType> map = {};
    for (VerificationType e in VerificationType.values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? VerificationType.createEmail;
  }
}
