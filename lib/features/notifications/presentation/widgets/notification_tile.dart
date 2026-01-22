import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class NotificationTile extends StatelessWidget {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final IconData icon;

  const NotificationTile({
    super.key,
    required this.title,
    required this.message,
    required this.time,
    this.isRead = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isRead ? Colors.transparent : AppColors.colorCompanyPrimary.withOpacity(0.03),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: isRead ? AppColors.lightGrey : AppColors.redBg.withOpacity(0.1),
          child: Icon(
            icon,
            color: isRead ? AppColors.disabledGrey : AppColors.colorCompanyPrimary,
            size: 20,
          ),
        ),
        title: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: isRead ? FontWeight.w600 : FontWeight.w900,
                  fontSize: 14,
                ),
              ),
            ),
            if (!isRead)
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.colorCompanyPrimary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              message,
              style: TextStyle(
                fontSize: 12,
                color: isRead ? AppColors.disabledGrey : AppColors.black,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: const TextStyle(fontSize: 10, color: AppColors.disabledGrey),
            ),
          ],
        ),
      ),
    );
  }
}