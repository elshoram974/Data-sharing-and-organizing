import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/auth_user_entity.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  Future<int> saveUser(AuthUserEntity user);
  AuthUserEntity? getCurrentUser();
  Future<int> logOut();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  AuthLocalDataSourceImp();

  @override
  Future<int> saveUser(AuthUserEntity user) {
    final Box<AuthUserEntity> userBox =
        Hive.box<AuthUserEntity>(AppStrings.userBox);

    return userBox.add(user);
  }

  @override
  AuthUserEntity? getCurrentUser() {
    final Box<AuthUserEntity> userBox =
        Hive.box<AuthUserEntity>(AppStrings.userBox);
    List<AuthUserEntity> users = userBox.values.toList();
    if (users.isEmpty) return null;
    return users.last;
  }

  @override
  Future<int> logOut() {
    final Box<AuthUserEntity> userBox =
        Hive.box<AuthUserEntity>(AppStrings.userBox);
    return userBox.clear();
  }
}
