import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_bottom_sheet.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_grid.dart'; // Import to access providers

void showProductFilters(BuildContext context) {
  showAppBottomSheet(
    context: context,
    title: 'Filter Products',
    child: const ProductFilterContent(),
  );
}

class ProductFilterContent extends ConsumerStatefulWidget {
  const ProductFilterContent({super.key});

  @override
  ConsumerState<ProductFilterContent> createState() => _ProductFilterContentState();
}

class _ProductFilterContentState extends ConsumerState<ProductFilterContent> {
  late RangeValues _currentRangeValues;
  late bool _inStockOnly;

  @override
  void initState() {
    super.initState();
    // Initialize state with current provider values
    _currentRangeValues = ref.read(productFilterPriceRangeProvider);
    _inStockOnly = ref.read(productFilterInStockProvider);
  }

  void _applyFilters() {
    ref.read(productFilterPriceRangeProvider.notifier).state = _currentRangeValues;
    ref.read(productFilterInStockProvider.notifier).state = _inStockOnly;
    Navigator.pop(context);
  }

  void _resetFilters() {
    setState(() {
      _currentRangeValues = const RangeValues(0, 300000);
      _inStockOnly = false;
    });
    // Optional: Apply reset immediately or wait for 'Apply'?
    // Usually 'Reset' resets the UI, and 'Apply' confirms.
    // Or Reset can close and reset. Let's just reset local state for now.
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Price Range', style: TextStyle(fontWeight: FontWeight.bold)),
          RangeSlider(
            values: _currentRangeValues,
            min: 0,
            max: 300000,
            divisions: 30,
            activeColor: AppColors.colorCompanyPrimary,
            labels: RangeLabels(
              '₹${_currentRangeValues.start.round()}',
              '₹${_currentRangeValues.end.round()}',
            ),
            onChanged: (RangeValues values) {
              setState(() => _currentRangeValues = values);
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹${_currentRangeValues.start.round()}', style: const TextStyle(fontSize: 12)),
              Text('₹${_currentRangeValues.end.round()}', style: const TextStyle(fontSize: 12)),
            ],
          ),
          const SizedBox(height: 24),
          const Text('Availability', style: TextStyle(fontWeight: FontWeight.bold)),
          SwitchListTile(
            title: const Text('In Stock Only', style: TextStyle(fontSize: 14)),
            value: _inStockOnly,
            activeThumbColor: AppColors.colorCompanyPrimary,
            onChanged: (val) => setState(() => _inStockOnly = val),
            contentPadding: EdgeInsets.zero,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: CustomButton(
                  text: 'RESET',
                  isOutlined: true,
                  onPressed: _resetFilters,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'APPLY',
                  onPressed: _applyFilters,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}