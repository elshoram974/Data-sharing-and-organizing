class NotificationDataEntity {
  final String title;
  final String message;
  final String topic;
  final Map<String, dynamic> data;

  NotificationDataEntity({
    required this.title,
    required this.message,
    required this.topic,
    required this.data,
  });

  NotificationDataEntity copyWith({
    String? title,
    String? message,
    String? topic,
    Map<String, dynamic>? data,
  }) =>
      NotificationDataEntity(
        title: title ?? this.title,
        message: message ?? this.message,
        topic: topic ?? this.topic,
        data: data ?? this.data,
      );
}
