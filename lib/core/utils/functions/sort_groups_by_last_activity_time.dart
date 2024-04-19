import '../../../features/user_home/domain/entities/group_home_entity.dart';

int compareLastActivity(GroupHomeEntity a, GroupHomeEntity b) {
  final DateTime aTime = a.lastActivity?.createdAt ?? a.createdAt;
  final DateTime bTime = b.lastActivity?.createdAt ?? b.createdAt;

  return bTime.compareTo(aTime);
}
