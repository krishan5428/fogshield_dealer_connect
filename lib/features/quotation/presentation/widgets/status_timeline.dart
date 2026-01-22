import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class StatusTimeline extends StatelessWidget {
  const StatusTimeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTimelineItem('Quotation Created', '22 Jan, 09:15 AM', true, true),
        _buildTimelineItem('Sent to Customer', '22 Jan, 10:30 AM', true, true),
        _buildTimelineItem('Customer Opened', '23 Jan, 11:45 AM', true, true),
        _buildTimelineItem('Accepted', '--', false, false),
      ],
    );
  }

  Widget _buildTimelineItem(String title, String time, bool isCompleted, bool showLine) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: isCompleted ? AppColors.colorCompanyPrimary : AppColors.grey,
                shape: BoxShape.circle,
              ),
            ),
            if (showLine)
              Container(
                width: 2,
                height: 40,
                color: isCompleted ? AppColors.colorCompanyPrimary : AppColors.grey,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: isCompleted ? AppColors.black : AppColors.disabledGrey,
                ),
              ),
              Text(
                time,
                style: const TextStyle(fontSize: 12, color: AppColors.disabledGrey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}