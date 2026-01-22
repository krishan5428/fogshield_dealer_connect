import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationSortDropdown extends StatelessWidget {
  const QuotationSortDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: 'Latest',
      icon: const Icon(Icons.sort_rounded, color: AppColors.colorCompanyPrimary, size: 18),
      underline: const SizedBox(),
      items: <String>['Latest', 'Oldest', 'High Amount', 'Low Amount'].map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        );
      }).toList(),
      onChanged: (_) {},
    );
  }
}