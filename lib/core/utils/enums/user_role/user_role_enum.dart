import 'package:hive/hive.dart';

part 'user_role_enum.g.dart';

@HiveType(typeId: 1)
enum UserRole {
  @HiveField(0)
  personalUser,
  @HiveField(1)
  businessUser,
  @HiveField(2)
  businessAdmin,
}
