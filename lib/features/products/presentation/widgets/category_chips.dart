import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class CategoryChips extends StatefulWidget {
  const CategoryChips({super.key});

  @override
  State<CategoryChips> createState() => _CategoryChipsState();
}

class _CategoryChipsState extends State<CategoryChips> {
  int _selectedIndex = 0;
  final List<String> _categories = [
    'All Products',
    'Fogshield Pro',
    'Fogshield Nexus',
    'Fogshield Edge',
    'Fogging Fluid',
    'Accessories'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          final isSelected = _selectedIndex == index;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(_categories[index].toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                setState(() => _selectedIndex = index);
              },
              selectedColor: AppColors.colorCompanyPrimary,
              backgroundColor: AppColors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : AppColors.disabledGrey,
                fontWeight: FontWeight.w900,
                fontSize: 10,
                letterSpacing: 0.5,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: isSelected ? AppColors.colorCompanyPrimary : AppColors.grey.withOpacity(0.3),
                ),
              ),
              showCheckmark: false,
              elevation: 0,
              pressElevation: 0,
            ),
          );
        },
      ),
    );
  }
}