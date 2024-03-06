import 'package:data_sharing_organizing/core/utils/constants/app_constants.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive/hive.dart';

import '../../../user_home/domain/entities/group_home_entity.dart';
import '../../domain/entities/auth_user_entity.dart';

abstract class AuthLocalDataSource {
  const AuthLocalDataSource();
  Future<int> saveUser(AuthUserEntity user);
  AuthUserEntity? getCurrentUser();
  Future<void> logOut();
}

class AuthLocalDataSourceImp extends AuthLocalDataSource {
  AuthLocalDataSourceImp();
  late final Box<AuthUserEntity> userBox =
      Hive.box<AuthUserEntity>(AppStrings.userBox);

  @override
  Future<int> saveUser(AuthUserEntity user) => userBox.add(user);

  @override
  AuthUserEntity? getCurrentUser() {
    final List<AuthUserEntity> users = userBox.values.toList();
    if (users.isEmpty) return null;
    return users.last;
  }

  @override
  Future<void> logOut() async {
    await Future.wait([
      if (!AppConst.isWeb) DefaultCacheManager().emptyCache(),
      Hive.box<GroupHomeEntity>(AppStrings.groupsBox).clear(),
      userBox.clear(),
    ]);
  }
}
