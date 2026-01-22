import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

enum QuotationStatus { draft, sent, accepted, rejected }

class QuotationStatusBadge extends StatelessWidget {
  final QuotationStatus status;

  const QuotationStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;

    switch (status) {
      case QuotationStatus.draft:
        color = AppColors.greyDark;
        label = 'DRAFT';
        break;
      case QuotationStatus.sent:
        color = Colors.blue;
        label = 'SENT';
        break;
      case QuotationStatus.accepted:
        color = AppColors.green;
        label = 'ACCEPTED';
        break;
      case QuotationStatus.rejected:
        color = AppColors.mutedRed;
        label = 'REJECTED';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}