import 'package:cached_network_image/cached_network_image.dart';
import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../auth/domain/entities/auth_user_entity.dart';

abstract class EditProfileLocalDataSource {
  const EditProfileLocalDataSource();

  Future<AuthUserEntity> changePassword(String newPass);
  Future<AuthUserEntity> changeName(String fName, String lName);
  Future<AuthUserEntity> changeImage(String imageLink , String newLink);
  Future<AuthUserEntity> deleteImage(String imageLink);
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
  
  @override
  Future<AuthUserEntity> changeImage(String imageLink , String newLink) async{
    final AuthUserEntity user = _userBox.values.last.copyWith(image: newLink);
    await Future.wait([_userBox.clear(),CachedNetworkImage.evictFromCache(imageLink)]);
   
    await _userBox.add(user);

    return user;
  }
  @override
  Future<AuthUserEntity> deleteImage(String imageLink) async{
    AuthUserEntity user = _userBox.values.last;
    await Future.wait([_userBox.clear(),CachedNetworkImage.evictFromCache(imageLink)]);
    user = AuthUserEntity(
          image: null,
          id: user.id,
          name: user.name,
          email: user.email,
          password: user.password,
          userType: user.userType,
        );
    await _userBox.add(user);

    return user;
  }
}
