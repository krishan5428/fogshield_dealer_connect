import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationSearchBar extends StatelessWidget {
  final Function(String)? onChanged;

  const QuotationSearchBar({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24), // Rounded search bar
        border: Border.all(color: AppColors.grey.withOpacity(0.3)),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        decoration: const InputDecoration(
          hintText: 'Search by Customer or ID...',
          prefixIcon: Icon(
            Icons.search_rounded,
            size: 20,
            color: AppColors.colorAccent,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          hintStyle: TextStyle(
            fontSize: 13,
            color: AppColors.disabledGrey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}