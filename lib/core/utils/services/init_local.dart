import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:data_sharing_organizing/core/utils/enums/user_role/user_type_enum.dart';
import 'package:data_sharing_organizing/features/auth/domain/entities/auth_user_entity.dart';
import 'package:data_sharing_organizing/features/user_home/domain/entities/group_home_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../features/chat/data/models/attachment_model.dart';
import '../../../features/chat/data/models/group_details_members/group_details_members.dart';
import '../../../features/chat/data/models/group_details_members/group_members_model.dart';
import '../../../features/chat/domain/entities/activity_entity.dart';
import '../../../features/chat/domain/entities/directory_entity.dart';
import '../../../features/chat/domain/entities/member_entity.dart';
import '../../../features/user_home/domain/entities/group_notification_entity.dart';
import '../enums/home/group_access_type_enum.dart';
import '../enums/home/group_discussion_type_enum.dart';
import '../enums/home/group_status_enum.dart';
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
    Hive.openBox<ActivityEntity>(AppStrings.activitiesBox),
    Hive.openBox<DirectoryEntity>(AppStrings.directoriesBox),
    Hive.openBox<GroupHomeEntity>(AppStrings.groupsBox),
    Hive.openBox<GroupNotificationEntity>(AppStrings.notificationBox),
    Hive.openBox<String>(AppStrings.botMessagesBox),
    Hive.openBox<String>(AppStrings.localConfig),
    Hive.openBox<GroupDetailsMembers>(AppStrings.groupsMembers),
  ]);

  config = Hive.box<String>(AppStrings.localConfig);
}

void _registerAdapterFn() {
  Hive.registerAdapter<UserType>(UserTypeAdapter()); //* it in auth user entity
  Hive.registerAdapter<AuthUserEntity>(
    AuthUserEntityAdapter(),
  ); //* it in group entity

  Hive.registerAdapter<MessageType>(
    MessageTypeAdapter(),
  ); //* it in group entity
  Hive.registerAdapter<GroupDiscussionType>(
    GroupDiscussionTypeAdapter(),
  ); //* it in group entity
  Hive.registerAdapter<GroupAccessType>(
    GroupAccessTypeAdapter(),
  ); //* it in group entity
  Hive.registerAdapter<GroupStatus>(
    GroupStatusAdapter(),
  ); //* it in group entity

  Hive.registerAdapter<NotificationEnum>(
    NotificationEnumAdapter(),
  ); //* it in member entity
  Hive.registerAdapter<MemberEntity>(
    MemberEntityAdapter(),
  ); //* it in group and activity entity

  Hive.registerAdapter<AttachmentModel>(
    AttachmentModelAdapter(),
  ); //* it in activity entity

  Hive.registerAdapter<ActivityEntity>(
    ActivityEntityAdapter(),
  ); //* it in group entity
  Hive.registerAdapter<DirectoryEntity>(
    DirectoryEntityAdapter(),
  ); //* it in group entity

  Hive.registerAdapter<GroupHomeEntity>(
    GroupHomeEntityAdapter(),
  ); //* it in member entity :(

  Hive.registerAdapter<GroupNotificationEntity>(
    GroupNotificationEntityAdapter(),
  ); //* it in member entity :(

  Hive.registerAdapter<GroupMember>(GroupMemberAdapter());
  Hive.registerAdapter<GroupDetailsMembers>(GroupDetailsMembersAdapter());
}
