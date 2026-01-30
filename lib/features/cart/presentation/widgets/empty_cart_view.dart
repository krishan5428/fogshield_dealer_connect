import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_basket_outlined, size: 80, color: AppColors.grey),
            const SizedBox(height: 24),
            const Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add some products to your quotation to see them here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.disabledGrey),
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: 'BROWSE PRODUCTS',
              isFullWidth: false,
              onPressed: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}