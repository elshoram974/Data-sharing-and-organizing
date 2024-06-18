import 'package:equatable/equatable.dart';

class MemberListTileEntity extends Equatable {
  final int id;
  final String name;
  final bool isAdmin;
  final String? imageLink;
  final DateTime lastLogin;
  final bool isSelected;

  const MemberListTileEntity({
    required this.id,
    required this.name,
    required this.isAdmin,
    required this.imageLink,
    required this.lastLogin,
    required this.isSelected,
  });
  @override
  List<Object?> get props => [
        id,
        name,
        isAdmin,
        imageLink,
        lastLogin,
        isSelected,
      ];
}
