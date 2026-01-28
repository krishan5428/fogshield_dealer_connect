import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

class CategoryChips extends ConsumerWidget {
  const CategoryChips({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Current filter value from provider
    final selectedCategory = ref.watch(selectedCategoryProvider);

    // Map chip names to our internal Category IDs
    final List<Map<String, String>> categories = [
      {'label': 'All Products', 'id': 'ALL'},
      {'label': 'Fogshield Pro', 'id': 'PRO'},
      {'label': 'Fogshield Nexus', 'id': 'NEXUS'},
      {'label': 'Fogging Fluid', 'id': 'FLUID'},
      {'label': 'Accessories', 'id': 'ACCESSORY'},
      {'label': 'Software/Services', 'id': 'SOFTWARE'},
    ];

    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = selectedCategory == category['id'];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: ChoiceChip(
              label: Text(category['label']!.toUpperCase()),
              selected: isSelected,
              onSelected: (selected) {
                // Update the global filter provider
                ref.read(selectedCategoryProvider.notifier).state = category['id']!;
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