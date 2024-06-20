import 'package:equatable/equatable.dart';

import '../../../features/chat/data/models/search_member_model/searched_user_model.dart';

class MemberListTileEntity extends Equatable {
  final int id;
  final String name;
  final bool isAdmin;
  final bool isBlocked;
  final String? imageLink;
  final DateTime lastLogin;
  final bool isSelected;

  const MemberListTileEntity({
    required this.id,
    required this.name,
    required this.isAdmin,
    required this.isBlocked,
    required this.imageLink,
    required this.lastLogin,
    required this.isSelected,
  });

  factory MemberListTileEntity.fromSearch(SearchedUserModel user) {
    return MemberListTileEntity(
      id: user.userId,
      isAdmin: false,
      isBlocked: false,
      name: '${user.firstName} ${user.lastName}',
      imageLink: user.image,
      lastLogin: user.lastLogin,
      isSelected: false,
    );
  }

  MemberListTileEntity copyWith({
    int? id,
    String? name,
    bool? isAdmin,
    bool? isBlocked,
    String? imageLink,
    DateTime? lastLogin,
    bool? isSelected,
  }) {
    return MemberListTileEntity(
      id: id ?? this.id,
      isAdmin: isAdmin ?? this.isAdmin,
      isBlocked: isBlocked ?? this.isBlocked,
      name: name ?? this.name,
      imageLink: imageLink ?? this.imageLink,
      lastLogin: lastLogin ?? this.lastLogin,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        isAdmin,
        isBlocked,
        imageLink,
        lastLogin,
      ];
}
