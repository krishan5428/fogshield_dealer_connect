import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationMetaInfo extends StatelessWidget {
  const QuotationMetaInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.colorCompanyPrimary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.colorCompanyPrimary.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildMetaItem('Quotation ID', 'QT-2026-0082', context),
          _buildMetaItem('Date', '22 Jan 2026', context),
          _buildMetaItem('Validity', '30 Days', context),
        ],
      ),
    );
  }

  Widget _buildMetaItem(String label, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppColors.disabledGrey, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 13, color: AppColors.colorCompanyPrimary),
        ),
      ],
    );
  }
}