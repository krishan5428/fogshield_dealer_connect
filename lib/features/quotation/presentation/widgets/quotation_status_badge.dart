import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
// Import the database tables to use the unified enum
import 'package:fogshield_dealer_connect/core/database/app_database_tables.dart' as tables;

class QuotationStatusBadge extends StatelessWidget {
  // Use the unified enum from the database
  final tables.QuotationStatus status;

  const QuotationStatusBadge({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    Color color;
    String label;

    switch (status) {
      case tables.QuotationStatus.draft:
        color = AppColors.greyDark;
        label = 'DRAFT';
        break;
      case tables.QuotationStatus.sent:
        color = Colors.blue;
        label = 'SENT';
        break;
      case tables.QuotationStatus.accepted:
        color = AppColors.green;
        label = 'ACCEPTED';
        break;
      case tables.QuotationStatus.rejected:
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