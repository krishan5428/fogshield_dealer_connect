import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationSearchBar extends StatelessWidget {
  const QuotationSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: 'Search by Customer or ID...',
          prefixIcon: Icon(Icons.search_rounded, size: 20, color: AppColors.colorAccent),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }
}