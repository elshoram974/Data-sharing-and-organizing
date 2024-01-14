import 'package:hive/hive.dart';

part 'user_role_enum.g.dart';

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  personalUser('personal_user'),
  @HiveField(1)
  businessUser('business_user'),
  @HiveField(2)
  businessAdmin('business_admin');

  final String inString;
  const UserRole(this.inString);

  factory UserRole.fromString(String? stringRole) {
    Map<String, UserRole> map = {};
    for (UserRole e in UserRole.values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? UserRole.personalUser;
  }
}
