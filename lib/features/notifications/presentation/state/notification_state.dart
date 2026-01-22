class AppNotification {
  final String id;
  final String title;
  final String message;
  final DateTime timestamp;
  final bool isRead;
  final String type;

  AppNotification({
    required this.id,
    required this.title,
    required this.message,
    required this.timestamp,
    this.isRead = false,
    required this.type,
  });
}

class NotificationState {
  final List<AppNotification> notifications;
  final int unreadCount;

  NotificationState({required this.notifications, this.unreadCount = 0});
}