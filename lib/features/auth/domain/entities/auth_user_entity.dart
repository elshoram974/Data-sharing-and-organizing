import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'auth_user_entity.g.dart';

@HiveType(typeId: 2)
class AuthUserEntity extends Equatable {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String email;
  @HiveField(2)
  final String password;
  @HiveField(3)
  final AccountType accountType;

  const AuthUserEntity({
    required this.name,
    required this.email,
    required this.password,
    required this.accountType,
  });

  AuthUserEntity copyWith({
    String? name,
    String? email,
    String? password,
    AccountType? accountType,
  }) {
    return AuthUserEntity(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      accountType: accountType ?? this.accountType,
    );
  }

  @override
  List<Object?> get props => [name, email, password, accountType];
}
