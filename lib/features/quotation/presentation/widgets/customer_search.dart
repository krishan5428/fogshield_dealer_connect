import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class CustomerSearch extends StatelessWidget {
  const CustomerSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          const Icon(Icons.search_rounded, color: AppColors.colorAccent),
          const SizedBox(width: 12),
          const Expanded(
            child: Text(
              'Search existing customer...',
              style: TextStyle(color: AppColors.disabledGrey),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person_add_alt_1_outlined, color: AppColors.colorCompanyPrimary),
          ),
        ],
      ),
    );
  }
}