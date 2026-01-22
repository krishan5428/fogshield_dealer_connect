import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_search_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/category_chips.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_grid.dart';
import 'package:fogshield_dealer_connect/core/widgets/cart_badge.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class ProductSelectionPage extends StatelessWidget {
  const ProductSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Select Fogshield Products'),
      body: Column(
        children: [
          const StepperIndicator(currentStep: 2),
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ProductSearchBar(),
          ),
          const CategoryChips(),
          const Expanded(
            child: ProductGrid(),
          ),
        ],
      ),
      floatingActionButton: const CartBadge(),
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
          text: 'REVIEW SELECTION (3 ITEMS)',
          onPressed: () => context.push(RouteNames.cart),
        ),
      ),
    );
  }
}