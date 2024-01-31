final class GroupHomeEntity {
  final String? imageLink;
  final String groupName;
  final String? lastMessage;
  final int? unReadCounter;
  final bool isUnread;
  final DateTime lastMessageTime;

  GroupHomeEntity({
    required this.imageLink,
    required this.groupName,
    required this.lastMessage,
    required this.unReadCounter,
    required this.isUnread,
    required this.lastMessageTime,
  });
}
