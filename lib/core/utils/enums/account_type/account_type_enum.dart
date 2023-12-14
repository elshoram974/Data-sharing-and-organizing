import 'package:hive/hive.dart';

part 'account_type_enum.g.dart';

@HiveType(typeId: 1)
enum AccountType {
  @HiveField(0)
  personal,
  @HiveField(1)
  business,
}
