import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_search_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/category_chips.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_grid.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';

class ProductSelectionPage extends ConsumerWidget {
  const ProductSelectionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the cart state to get real-time total items
    final cartItems = ref.watch(cartProvider).items;
    final totalItems = cartItems.fold(0, (sum, item) => sum + item.quantity);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Select Fogshield Products'),
      body: const Column(
        children: [
          StepperIndicator(currentStep: 2),
          Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ProductSearchBar(),
          ),
          CategoryChips(),
          Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 10,
            ),
          ],
        ),
        child: CustomButton(
          text: totalItems > 0
              ? 'REVIEW SELECTION ($totalItems ${totalItems == 1 ? 'ITEM' : 'ITEMS'})'
              : 'REVIEW SELECTION (0 ITEMS)',
          onPressed: totalItems > 0
              ? () => context.push(RouteNames.cart)
              : null,
        ),
      ),
    );
  }
}