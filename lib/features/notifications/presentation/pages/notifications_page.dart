import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:fogshield_dealer_connect/features/notifications/presentation/widgets/notification_filter.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Alert Center'),
      body: Column(
        children: [
          const NotificationFilter(),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: const [
                NotificationTile(
                  title: 'New Offer Available',
                  message: 'Exclusive 15% discount on Bulk Fluid orders.',
                  time: '2 mins ago',
                  icon: Icons.local_offer_outlined,
                ),
                NotificationTile(
                  title: 'Quotation Viewed',
                  message: 'Customer John Wick viewed Quotation #QT-2026-0082.',
                  time: '45 mins ago',
                  icon: Icons.visibility_outlined,
                ),
                NotificationTile(
                  title: 'Stock Update',
                  message: 'SEC FSG1B units are now back in stock at Delhi Hub.',
                  time: '3 hours ago',
                  isRead: true,
                  icon: Icons.inventory_2_outlined,
                ),
                NotificationTile(
                  title: 'Policy Update',
                  message: 'Please review the updated dealer warranty terms.',
                  time: 'Yesterday',
                  isRead: true,
                  icon: Icons.gavel_rounded,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}