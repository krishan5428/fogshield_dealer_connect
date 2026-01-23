import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/state/notification_state.dart';

final notificationProvider = StateNotifierProvider<NotificationNotifier, NotificationState>((ref) {
  return NotificationNotifier();
});

class NotificationNotifier extends StateNotifier<NotificationState> {
  NotificationNotifier() : super(NotificationState(notifications: [
    AppNotification(
      id: '1',
      title: 'New Offer Available',
      message: 'Exclusive 15% discount on Bulk Fluid orders.',
      timestamp: DateTime.now(),
      type: 'offer',
    ),
    AppNotification(
      id: '2',
      title: 'Quotation Viewed',
      message: 'Customer John Wick viewed Quotation #QT-2026-0082.',
      timestamp: DateTime.now().subtract(const Duration(minutes: 45)),
      type: 'quotation',
    ),
  ], unreadCount: 2));

  void markAsRead(String id) {
    state = state.copyWith(
      notifications: state.notifications.map((n) {
        if (n.id == id) return n.copyWith(isRead: true);
        return n;
      }).toList(),
      unreadCount: state.unreadCount > 0 ? state.unreadCount - 1 : 0,
    );
  }

  // Implementation to clear all notifications from the list
  void clearAll() {
    state = state.copyWith(
      notifications: [],
      unreadCount: 0,
    );
  }

  void markAllAsRead() {
    // For this specific request, we will empty the list as "Clear All"
    clearAll();
  }
}