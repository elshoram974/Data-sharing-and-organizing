import '../../../features/user_home/domain/entities/group_home_entity.dart';

int compareLastActivity(GroupHomeEntity a, GroupHomeEntity b) {
  final DateTime aTime = a.lastActivity?.createdAt ?? a.memberEntity.joinDate;
  final DateTime bTime = b.lastActivity?.createdAt ?? b.memberEntity.joinDate;

  return bTime.compareTo(aTime);
}
