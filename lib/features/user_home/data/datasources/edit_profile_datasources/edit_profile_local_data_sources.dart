import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileLocalDataSource {
  const EditProfileLocalDataSource();

  Future<AuthUserEntity> changePassword(String newPass);
  Future<AuthUserEntity> changeName(String fName, String lName);
}

class EditProfileLocalDataSourceImp extends EditProfileLocalDataSource {
  EditProfileLocalDataSourceImp();

  late final Box<AuthUserEntity> _userBox =
      Hive.box<AuthUserEntity>(AppStrings.userBox);

  @override
  Future<AuthUserEntity> changePassword(String newPass) async {
    final AuthUserEntity savedUser =
        _userBox.values.last.copyWith(password: newPass);
    _userBox.clear();
    await _userBox.add(savedUser);
    return savedUser;
  }

  @override
  Future<AuthUserEntity> changeName(String fName, String lName) async {
    final AuthUserEntity savedUser = _userBox.values.last.copyWith(name: '$fName $lName');
    await _userBox.clear();
    await _userBox.add(savedUser);
    return savedUser;
  }
}
