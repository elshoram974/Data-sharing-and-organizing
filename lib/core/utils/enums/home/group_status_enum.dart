import 'package:hive/hive.dart';

part 'group_status_enum.g.dart';

@HiveType(typeId: 15)
enum GroupStatus {
  @HiveField(1)
  active('active'),
  @HiveField(2)
  inactive('inactive'),
  @HiveField(3)
  suspended('suspended'),
  @HiveField(4)
  deleted('deleted'),
  @HiveField(5)
  pending('pending');

  final String inString;
  const GroupStatus(this.inString);

  factory GroupStatus.fromString(String? stringRole) {
    Map<String, GroupStatus> map = {};
    for (GroupStatus e in values) {
      map[e.inString] = e;
    }

    return map[stringRole] ?? active;
  }
}
