import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileLocalDataSource {
  const EditProfileLocalDataSource();

  Future<AuthUserEntity> changePassword(String newPass, AuthUserEntity userToReplace);
  Future<AuthUserEntity> changeUser(AuthUserEntity userToReplace);
}

class EditProfileLocalDataSourceImp extends EditProfileLocalDataSource {
  EditProfileLocalDataSourceImp();

  late final Box<AuthUserEntity> _userBox = Hive.box<AuthUserEntity>(AppStrings.userBox);

  @override
  Future<AuthUserEntity> changePassword(String newPass, AuthUserEntity userToReplace) {
    return changeUser(userToReplace, newPass);
  }

  @override
  Future<AuthUserEntity> changeUser(
    AuthUserEntity userToReplace, [
    String? passToSave,
  ]) async {
    final AuthUserEntity savedUser = _userBox.values.last;
    await Future.wait([
      _userBox.clear(),
      if (userToReplace.image != savedUser.image)
        CachedNetworkImage.evictFromCache(savedUser.image ?? ''),
    ]);

    await _userBox.add(userToReplace.copyWith(
      password: passToSave ?? savedUser.password,
      image: userToReplace.image,
    ));
    return _userBox.values.last;
  }
}
