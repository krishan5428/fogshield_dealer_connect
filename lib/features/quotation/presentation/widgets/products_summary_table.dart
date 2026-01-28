import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

class ProductsSummaryTable extends StatelessWidget {
  final List<QuotationItem> items;
  final double totalAmount;

  const ProductsSummaryTable({
    super.key,
    required this.items,
    required this.totalAmount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          decoration: const BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: const Row(
            children: [
              Expanded(flex: 3, child: Text('Item Model', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black))),
              Expanded(child: Text('Qty', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black), textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text('Total', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.black), textAlign: TextAlign.right)),
            ],
          ),
        ),

        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(height: 1),
          itemBuilder: (context, index) {
            final item = items[index];
            final rowTotal = item.quantity * item.priceAtTimeOfSale;

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      item.productModel,
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
                      '₹${rowTotal.toStringAsFixed(0)}',
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w900),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),

        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.colorCompanyPrimary.withOpacity(0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Grand Total', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
              Text(
                '₹${totalAmount.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.colorCompanyPrimary, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }
}