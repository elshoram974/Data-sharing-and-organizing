import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/account_type/account_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/user_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences pref;

Future<void> localInstance() async {
  await Future.wait([
    _sharedPref(),
    Hive.initFlutter(),
  ]);
  _registerAdapterFn();
  await Hive.openBox<UserEntity>(AppStrings.userBox);
}

void _registerAdapterFn() {
  Hive.registerAdapter<AccountType>(AccountTypeAdapter());
  Hive.registerAdapter<UserEntity>(UserEntityAdapter());
}

Future<void> _sharedPref() async => pref = await SharedPreferences.getInstance();
