import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/empty_state.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/providers/notification_providers.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

@RoutePage()
class NotificationsPage extends ConsumerWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Alert Center'),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: AppColors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${state.notifications.length} ALERTS',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.0,
                    color: AppColors.disabledGrey,
                  ),
                ),
                if (state.notifications.isNotEmpty)
                  TextButton(
                    onPressed: () => ref.read(notificationProvider.notifier).clearAll(),
                    child: const Text(
                      'CLEAR ALL',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w900,
                        color: AppColors.mutedRed,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: state.notifications.isEmpty
                ? const EmptyState(
              title: 'No Notifications',
              description: 'You are all caught up! New alerts will appear here.',
              icon: Icons.notifications_none_rounded,
            )
                : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.notifications.length,
              itemBuilder: (context, index) {
                final notification = state.notifications[index];
                return NotificationTile(
                  title: notification.title,
                  message: notification.message,
                  time: 'Just now',
                  isRead: notification.isRead,
                  icon: notification.type == 'offer' ? Icons.local_offer_outlined : Icons.description_outlined,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}