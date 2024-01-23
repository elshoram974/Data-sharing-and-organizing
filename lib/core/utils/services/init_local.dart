import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_role_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

  late final Box<String> config ;


Future<void> localInstance() async {
  await Future.wait([
    Hive.initFlutter(),
  ]);
  _registerAdapterFn();

  await Future.wait([
     Hive.openBox<AuthUserEntity>(AppStrings.userBox),
     Hive.openBox<String>(AppStrings.localConfig),
  ]);

  _makeConfigInstance();
}

void _registerAdapterFn() {
  Hive.registerAdapter<UserRole>(UserRoleAdapter());
  Hive.registerAdapter<AuthUserEntity>(AuthUserEntityAdapter());
}

Future<void> _makeConfigInstance() async => config = Hive.box<String>(AppStrings.localConfig);