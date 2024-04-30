import 'package:equatable/equatable.dart';

class MemberListTileEntity extends Equatable {
  final String name;
  final String? imageLink;
  final DateTime lastLogin;
  final bool isSelected;
  final void Function()? onTileTapped;

  const MemberListTileEntity({
    required this.name,
    required this.imageLink,
    required this.lastLogin,
    required this.isSelected,
    this.onTileTapped,
  });
  @override
  List<Object?> get props => [
        name,
        imageLink,
        lastLogin,
        isSelected,
        onTileTapped,
      ];
}