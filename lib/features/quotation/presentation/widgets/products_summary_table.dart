import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';

class ProductsSummaryTable extends ConsumerWidget {
  const ProductsSummaryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the actual cart state
    final cartState = ref.watch(cartProvider);
    final items = cartState.items;

    if (items.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'No items selected',
          style: TextStyle(color: AppColors.disabledGrey, fontStyle: FontStyle.italic),
        ),
      );
    }

    return Column(
      children: [
        // Table Header
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: const Row(
            children: [
              Expanded(flex: 3, child: Text('Item', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black))),
              Expanded(child: Text('Qty', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black), textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text('Total', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black), textAlign: TextAlign.right)),
            ],
          ),
        ),

        // List of actual items from Cart
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      item.name,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.black),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      item.quantity.toString(),
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      '₹${item.total.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        // Dynamic Subtotal Footer inside the table
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.colorCompanyPrimary.withOpacity(0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Items Subtotal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(
                '₹${cartState.total.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.colorCompanyPrimary, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}