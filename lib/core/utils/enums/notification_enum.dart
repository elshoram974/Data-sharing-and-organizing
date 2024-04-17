import 'package:hive/hive.dart';

part 'notification_enum.g.dart';

@HiveType(typeId: 6)
enum NotificationEnum {
  @HiveField(0)
  notify('notify'),
  @HiveField(1)
  withoutNotify('without_notify'),
  @HiveField(2)
  customNotify('custom_notify');

  final String inString;
  const NotificationEnum(this.inString);

  factory NotificationEnum.fromString(String? stringRole) {
    Map<String, NotificationEnum> map = {};
    for (NotificationEnum e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? notify;
  }
}
