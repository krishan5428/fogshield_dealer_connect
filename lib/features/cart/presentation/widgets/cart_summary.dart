import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/price_row.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/discount_section.dart';

class CartSummary extends StatelessWidget {
  final double subtotal;
  final double discount;
  final double tax;
  final double total;
  final Function(double) onDiscountApplied;

  const CartSummary({
    super.key,
    required this.subtotal,
    required this.discount,
    required this.tax,
    required this.total,
    required this.onDiscountApplied,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, -5),
            blurRadius: 15,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Pass the callback down to the discount section
          DiscountSection(onDiscountApplied: onDiscountApplied),
          const SizedBox(height: 20),
          PriceRow(label: 'Subtotal', value: '₹${subtotal.toStringAsFixed(0)}'),
          PriceRow(
            label: 'Dealer Discount',
            value: '-₹${discount.toStringAsFixed(0)}',
            valueColor: AppColors.connectionGreen,
          ),
          PriceRow(label: 'GST (18%)', value: '₹${tax.toStringAsFixed(0)}'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Divider(),
          ),
          PriceRow(
            label: 'Quotation Total',
            value: '₹${total.toStringAsFixed(0)}',
            isBold: true,
          ),
        ],
      ),
    );
  }
}