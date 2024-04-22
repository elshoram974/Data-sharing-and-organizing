import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

import 'member_entity.dart';

part 'directory_entity.g.dart';

@HiveType(typeId: 9)
class DirectoryEntity extends Equatable {
  const DirectoryEntity({
    required this.id,
    required this.name,
    this.insideDirectoryId,
    required this.groupId,
    required this.createdBy,
    this.isApproved = false,
  });
  
  @HiveField(0)
  final int id;

  @HiveField(1)
  final MemberEntity createdBy;

  @HiveField(2)
  final int groupId;

  @HiveField(3)
  final String name;

  @HiveField(4)
  final int? insideDirectoryId;

  @HiveField(5)
  final bool isApproved;

  factory DirectoryEntity.newEmpty() {
    return DirectoryEntity(
      id: -1,
      name: '',
      groupId: -1,
      createdBy: MemberEntity.newEmpty(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        insideDirectoryId,
        isApproved,
        createdBy,
      ];
}
