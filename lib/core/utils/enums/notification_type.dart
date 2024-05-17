enum NotificationType {
  info('info'),
  message('message'),
  activity('activity');

  final String inString;
  const NotificationType(this.inString);

  factory NotificationType.fromString(String? stringRole) {
    Map<String, NotificationType> map = {};
    for (NotificationType e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? info;
  }

  static final Map<NotificationType, dynamic> goTo = {
    info: "open notification",
    message: "open group and open chat",
    activity: "open group and open bot",
  };
}
