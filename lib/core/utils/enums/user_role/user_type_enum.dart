import 'package:hive/hive.dart';

part 'user_type_enum.g.dart';

@HiveType(typeId: 1)
enum UserType {
  @HiveField(0)
  personal('personal'),
  @HiveField(1)
  business('business');

  final String inString;
  const UserType(this.inString);

  factory UserType.fromString(String? stringRole) {
    Map<String, UserType> map = {};
    for (UserType e in UserType.values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? UserType.personal;
  }
}
