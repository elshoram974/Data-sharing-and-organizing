import 'package:hive/hive.dart';

part 'member_notification_enum.g.dart';

@HiveType(typeId: 6)
enum MemberNotificationEnum {
  @HiveField(0)
  notify('notify'),
  @HiveField(1)
  withoutNotify('without_notify'),
  @HiveField(2)
  customNotify('custom_notify');

  final String inString;
  const MemberNotificationEnum(this.inString);

  factory MemberNotificationEnum.fromString(String? stringRole) {
    Map<String, MemberNotificationEnum> map = {};
    for (MemberNotificationEnum e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? notify;
  }
}
