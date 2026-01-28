import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/database/app_database_tables.dart' as tables;

class StatusTimeline extends StatelessWidget {
  final DateTime createdAt;
  final tables.QuotationStatus status;

  const StatusTimeline({
    super.key,
    required this.createdAt,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    bool isSent = status.index >= tables.QuotationStatus.sent.index;
    bool isAccepted = status == tables.QuotationStatus.accepted;

    return Column(
      children: [
        _buildTimelineItem(
            'Quotation Created',
            DateFormat('dd MMM, hh:mm a').format(createdAt),
            true,
            true
        ),
        _buildTimelineItem(
            'Sent to Customer',
            isSent ? DateFormat('dd MMM, hh:mm a').format(createdAt.add(const Duration(minutes: 5))) : '--',
            isSent,
            true
        ),
        _buildTimelineItem(
            'Accepted',
            isAccepted ? 'Confirmed' : '--',
            isAccepted,
            false
        ),
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