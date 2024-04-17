import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_home_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/chat/domain/entities/member_entity.dart';
import '../enums/home/group_discussion_type_enum.dart';
import '../enums/notification_enum.dart';
import '../enums/message_type/message_type.dart';

late final Box<String> config;

Future<void> localInstance() async {
  await Future.wait([
    Hive.initFlutter(),
  ]);
  _registerAdapterFn();

  await Future.wait([
    Hive.openBox<AuthUserEntity>(AppStrings.userBox),
    Hive.openBox<GroupHomeEntity>(AppStrings.groupsBox),
    Hive.openBox<String>(AppStrings.localConfig),
  ]);

  config = Hive.box<String>(AppStrings.localConfig);
}

void _registerAdapterFn() {
  Hive.registerAdapter<UserType>(UserTypeAdapter());  //* it in auth user entity
  Hive.registerAdapter<AuthUserEntity>(AuthUserEntityAdapter());//* it in group entity

  Hive.registerAdapter<MessageType>(MessageTypeAdapter()); //* it in group entity
  Hive.registerAdapter<GroupDiscussionType>(GroupDiscussionTypeAdapter());//* it in group entity

  Hive.registerAdapter<NotificationEnum>(NotificationEnumAdapter()); //* it in member entity
  Hive.registerAdapter<MemberEntity>(MemberEntityAdapter());//* it in group entity

  Hive.registerAdapter<GroupHomeEntity>(GroupHomeEntityAdapter()); //* it in member entity :(
}