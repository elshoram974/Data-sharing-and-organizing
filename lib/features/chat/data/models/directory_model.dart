import 'dart:convert';

import '../../domain/entities/directory_entity.dart';
import 'member_model.dart';

class DirectoryModel extends DirectoryEntity {
  const DirectoryModel({
    required super.id,
    required super.name,
    required super.insideDirectoryId,
    required super.groupId,
    required super.createdBy,
    required super.isApproved,
  });

  factory DirectoryModel.fromMap(Map<String, dynamic> map) {
    return DirectoryModel(
      id: map['id'] as int,
      name: map['name'] as String,
      insideDirectoryId: map['insideDirectoryId'] as int?,
      groupId: map['groupId'] as int,
      createdBy: MemberModel.fromMap(map['createdBy'] as Map<String, dynamic>),
      isApproved: map['isApproved'] as bool,
    );
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> memberMap = MemberModel(
      user: createdBy.user,
      groupId: createdBy.groupId,
      canInteract: createdBy.canInteract,
      notification: createdBy.notification,
      joinDate: createdBy.joinDate,
      isAdmin: createdBy.isAdmin,
    ).toMap();
    return {
      'id': id,
      'name': name,
      'insideDirectoryId': insideDirectoryId,
      'groupId': groupId,
      'createdBy': memberMap,
      'isApproved': isApproved,
    };
  }

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DirectoryModel].
  factory DirectoryModel.fromJson(String data) {
    return DirectoryModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DirectoryModel] to a JSON string.
  String toJson() => json.encode(toMap());

  factory DirectoryModel.fromEntity(DirectoryEntity entity) {
    return DirectoryModel(
      id: entity.id,
      name: entity.name,
      insideDirectoryId: entity.insideDirectoryId,
      groupId: entity.groupId,
      createdBy: entity.createdBy,
      isApproved: entity.isApproved,
    );
  }

  @override
  List<Object?> get props => [...super.props];
}
