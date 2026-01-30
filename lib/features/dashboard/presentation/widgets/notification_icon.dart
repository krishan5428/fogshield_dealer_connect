import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class NotificationIcon extends StatelessWidget {
  final int count;

  const NotificationIcon({super.key, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: () => context.router.push(const NotificationsRoute()),
          icon: const Icon(Icons.notifications_none_rounded, size: 28),
        ),
        if (count > 0)
          Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: AppColors.mutedRed,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 16,
                minHeight: 16,
              ),
              child: Text(
                count > 9 ? '9+' : '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}