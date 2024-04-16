import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';

class DirectoryEntity extends Equatable {
  const DirectoryEntity({
    required this.id,
    required this.name,
    required this.insideDirectoryId,
    required this.groupId,
    required this.createdBy,
    this.isAccepted = false,
  });
  final int id;
  final AuthUserEntity createdBy;
  final int groupId;
  final String name;
  final int insideDirectoryId;
  final bool isAccepted;

  factory DirectoryEntity.newEmpty() {
    return const DirectoryEntity(
      id: -1,
      name: '',
      insideDirectoryId: 0,
      groupId: -1,
      createdBy: AuthUserEntity(
        id: -1,
        name: '',
        email: '',
        password: '',
        userType: UserType.personal,
      ),
    );
  }

  @override
  List<Object?> get props => [id, name, insideDirectoryId , createdBy];
}