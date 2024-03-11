import 'package:data_sharing_organizing/core/utils/constants/app_strings.dart';
import 'package:hive/hive.dart';

import '../../../../../core/utils/enums/message_type/message_type.dart';
import '../../../domain/entities/group_home_entity.dart';

abstract class HomeLocalDataSource {
  const HomeLocalDataSource();
  List<GroupHomeEntity> getAllGroups();
  Future<int> removeAllGroups();
  Future<Iterable<int>> saveGroups(List<GroupHomeEntity> newGroups);
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups);
  List<GroupHomeEntity> getSavedGroupsPerPage(int page, int pageSize);
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit);
}

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  HomeLocalDataSourceImp();
  late final Box<GroupHomeEntity> groupsBox = Hive.box<GroupHomeEntity>(AppStrings.groupsBox);

  @override
  List<GroupHomeEntity> getAllGroups() {
    if (groupsBox.isEmpty) return staticGroups();

    return groupsBox.values.toList();
  }

  @override
  Future<int> removeAllGroups() {
    return groupsBox.isNotEmpty ? groupsBox.clear() : Future.value(1);
  }

  @override
  Future<Iterable<int>> saveGroups(List<GroupHomeEntity> newGroups) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());
    for (final GroupHomeEntity e in newGroups) {
      if (groups.contains(e)) {
        groups.remove(e);
        groups.add(e);
      }
    }
    await removeAllGroups();
    return await groupsBox.addAll(groups);
  }

  @override
  Future<int> removeSomeGroups(List<GroupHomeEntity> removedGroups) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());
    groups.removeWhere((e) => removedGroups.contains(e));
    await removeAllGroups();
    await groupsBox.addAll(groups);
    return 1;
  }

  @override
  List<GroupHomeEntity> getSavedGroupsPerPage(int page, int pageSize) {
    int startIndex = (page - 1) * pageSize;
    List<GroupHomeEntity> allGroups = getAllGroups();
    allGroups.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime)); // Sort in descending order
    return allGroups.skip(startIndex).take(pageSize).toList();
  }

  @override
  Future<Iterable<int>> markAsUnRead(List<GroupHomeEntity> groupsToEdit) async {
    final List<GroupHomeEntity> groups = [];
    groups.addAll(getAllGroups());

    for (int i = 0; i < groups.length; i++) {
      if (groupsToEdit.contains(groups[i])) {
        groups[i] = groups[i].copyWith(isUnread: true);
      }
    }

    await removeAllGroups();
    return await groupsBox.addAll(groups);
  }
}

// TODO: delete this
List<GroupHomeEntity> staticGroups() {
  return [
    GroupHomeEntity(
      id: 1,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '1 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2023),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 2,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '2 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 3,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '3 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 4,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '4 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 5,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '5 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 6,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '6 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 7,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '7 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 8,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '8 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime.now(),
      ownerId: 42
    ),
    GroupHomeEntity(
      id: 9,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '9 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 10,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '10 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 11,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '11 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 12,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '12 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 13,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '13 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 14,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '14 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 15,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '15 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 16,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '16 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 17,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '17 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 18,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '18 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 19,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '19 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 20,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '20 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 21,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '21 aFirst year in THIET',
      lastMessageType: MessageType.textMessage,
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 22,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '22 First year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 23,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '23 Second year in THIET',
      lastMessage: 'محمد يلعب بالكرة',
      lastMessageType: MessageType.document,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
    GroupHomeEntity(
      id: 24,
      imageLink: 'https://images.justwatch.com/poster/248497985/s592/one-piece',
      groupName: '24 Third year in THIET',
      lastMessage:
          'Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message Last message ',
      lastMessageType: MessageType.textMessage,
      unReadCounter: null,
      isUnread: false,
      lastMessageTime: DateTime(2024),
      ownerId: 1
    ),
  ];
}
