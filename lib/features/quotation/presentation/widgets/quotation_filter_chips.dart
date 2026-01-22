import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationFilterChips extends StatefulWidget {
  const QuotationFilterChips({super.key});

  @override
  State<QuotationFilterChips> createState() => _QuotationFilterChipsState();
}

class _QuotationFilterChipsState extends State<QuotationFilterChips> {
  int _selectedIndex = 0;
  final List<String> _filters = ['All', 'Draft', 'Sent', 'Accepted', 'Rejected'];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _filters.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(_filters[index]),
              selected: isSelected,
              onSelected: (val) => setState(() => _selectedIndex = index),
              selectedColor: AppColors.colorCompanyPrimary,
              backgroundColor: AppColors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.disabledGrey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: isSelected ? AppColors.colorCompanyPrimary : AppColors.grey.withOpacity(0.3)),
              ),
              showCheckmark: false,
            ),
          );
        },
      ),
    );
  }
}