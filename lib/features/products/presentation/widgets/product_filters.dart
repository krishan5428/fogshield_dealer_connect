import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_bottom_sheet.dart';

void showProductFilters(BuildContext context) {
  showAppBottomSheet(
    context: context,
    title: 'Filter Products',
    child: const ProductFilterContent(),
  );
}

class ProductFilterContent extends StatefulWidget {
  const ProductFilterContent({super.key});

  @override
  State<ProductFilterContent> createState() => _ProductFilterContentState();
}

class _ProductFilterContentState extends State<ProductFilterContent> {
  RangeValues _currentRangeValues = const RangeValues(1000, 100000);
  bool _inStockOnly = true;

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
            max: 200000,
            divisions: 20,
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
            activeColor: AppColors.colorCompanyPrimary,
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
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: CustomButton(
                  text: 'APPLY',
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}