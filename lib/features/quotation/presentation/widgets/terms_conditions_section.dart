import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class TermsConditionsSection extends StatelessWidget {
  const TermsConditionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final terms = [
      'Quotation valid for 30 days from date of issue.',
      'Payment Terms: 50% advance, 50% on delivery.',
      'Delivery Time: 3-5 working days post order confirmation.',
      'Warranty as per company standard policy.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: terms.map((term) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('• ', style: TextStyle(color: AppColors.colorCompanyPrimary, fontWeight: FontWeight.bold)),
            Expanded(child: Text(term, style: const TextStyle(fontSize: 12, color: AppColors.colorAccent))),
          ],
        ),
      )).toList(),
    );
  }
}