final class GroupHomeEntity {
  final String? imageLink;
  final String groupName;
  final String? lastMessage;
  final int? unReadCounter;
  final bool isUnread;
  final DateTime lastMessageTime;

  GroupHomeEntity({
    this.imageLink,
    required this.groupName,
    this.lastMessage,
    this.unReadCounter,
    this.isUnread = false,
    required this.lastMessageTime,
  });
}
