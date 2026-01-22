import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class ProductsSummaryTable extends StatelessWidget {
  const ProductsSummaryTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock Data
    final items = [
      {'name': 'PPF Ultra 2026', 'qty': '2', 'price': '45,000', 'total': '90,000'},
      {'name': 'Ceramic Gold', 'qty': '1', 'price': '12,000', 'total': '12,000'},
    ];

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
              Expanded(flex: 3, child: Text('Item', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold))),
              Expanded(child: Text('Qty', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.center)),
              Expanded(flex: 2, child: Text('Total', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold), textAlign: TextAlign.right)),
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
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(item['name']!, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
                  ),
                  Expanded(
                    child: Text(item['qty']!, style: const TextStyle(fontSize: 13), textAlign: TextAlign.center),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text('₹${item['total']}', style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold), textAlign: TextAlign.right),
                  ),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.colorCompanyPrimary.withOpacity(0.05),
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(8)),
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Subtotal', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('₹1,02,000', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.colorCompanyPrimary)),
            ],
          ),
        ),
      ],
    );
  }
}