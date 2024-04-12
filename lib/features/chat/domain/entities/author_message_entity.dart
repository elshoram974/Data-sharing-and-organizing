import 'package:equatable/equatable.dart';

import '../../../auth/domain/entities/auth_user_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class MessageAuthor extends Equatable {
  final int id;
  final String fName;
  final String lName;
  final String? image;

  const MessageAuthor({
    required this.id,
    required this.fName,
    required this.lName,
    this.image,
  });

  static types.User messageAuthorFromAuth(AuthUserEntity user) {
    return MessageAuthor.fromAuth(user).messageAuthor();
  }

  types.User messageAuthor() {
    return types.User(
      id: id.toString(),
      firstName: fName,
      lastName: lName,
      imageUrl: image,
    );
  }

  factory MessageAuthor.fromAuth(AuthUserEntity user) {
    final List<String> nameParts = user.name.split(" ");
    final String fName = nameParts.first.trim();
    final String lName = nameParts.sublist(1).join(" ").trim();
    return MessageAuthor(
      id: user.id,
      fName: fName,
      lName: lName,
      image: user.image,
    );
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
