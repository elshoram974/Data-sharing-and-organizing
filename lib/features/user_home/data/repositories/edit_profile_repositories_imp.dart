import 'package:data_sharing_organizing/core/status/status.dart';
import 'package:data_sharing_organizing/core/utils/functions/execute_and_handle_remote_errors.dart';
import 'package:data_sharing_organizing/core/utils/services/dependency/locator.dart';

import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';

import '../../../auth/domain/usecases/log_out_use_case.dart';
import '../../domain/repositories/edit_profile_repositories.dart';
import '../datasources/edit_profile_datasources/edit_profile_local_data_sources.dart';
import '../datasources/edit_profile_datasources/edit_profile_remote_data_sources.dart';

class EditProfileRepositoriesImp extends EditProfileRepositories {
  final EditProfileLocalDataSource localDataSource;
  final EditProfileRemoteDataSource remoteDataSource;

  EditProfileRepositoriesImp({
    required this.localDataSource,
    required this.remoteDataSource,
  });

  @override
  Future<Status<bool>> deleteAccount(AuthUserEntity user) {
    return executeAndHandleErrors<bool>(
      () async {
        final bool isDeleted = await remoteDataSource.deleteAccount(user);
        if (isDeleted) sl.get<LogOutUseCase>().call();
        return isDeleted;
      },
    );
  }

  @override
  Future<Status<AuthUserEntity>> changePassword(
    int userId,
    String pass,
    String newPass,
  ) {
    return executeAndHandleErrors<AuthUserEntity>(
      () async {
        await remoteDataSource.changePass(userId, pass, newPass);
        final AuthUserEntity user = await localDataSource.changePassword(newPass);
        return user;
      },
    );
  }
  
  @override
  Future<Status<AuthUserEntity>> changeName(int userId, String fName, String lName) {
    return executeAndHandleErrors<AuthUserEntity>(
      () async {
        await remoteDataSource.changeName(userId, fName, lName);
        final AuthUserEntity user = await localDataSource.changeName(fName, lName);
        return user;
      },
    );
  }
}
