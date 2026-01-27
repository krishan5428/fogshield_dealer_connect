import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/cart_summary.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/empty_cart_view.dart';
import 'package:fogshield_dealer_connect/core/widgets/delete_confirmation_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the actual cart state from Riverpod
    final cartState = ref.watch(cartProvider);
    final items = cartState.items;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Review Selection'),
      body: items.isEmpty
          ? const EmptyCartView()
          : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const StepperIndicator(currentStep: 3),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'SELECTED UNITS',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      color: AppColors.colorAccent,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return CartItemCard(
                        item: item,
                        onQuantityChanged: (qty) {
                          ref.read(cartProvider.notifier).updateQuantity(
                            productId: item.id,
                            name: item.name,
                            price: item.price,
                            quantity: qty,
                            imageUrl: item.imageUrl,
                          );
                        },
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => DeleteConfirmationDialog(
                              itemName: item.name,
                              onConfirm: () {
                                ref.read(cartProvider.notifier).updateQuantity(
                                  productId: item.id,
                                  name: item.name,
                                  price: item.price,
                                  quantity: 0,
                                );
                              },
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            CartSummary(
              subtotal: cartState.subtotal,
              discount: cartState.discountAmount,
              tax: cartState.tax,
              total: cartState.total,
              onDiscountApplied: (pct) {
                ref.read(cartProvider.notifier).applyDiscount(pct);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 48),
              child: Column(
                children: [
                  const Text(
                    'By proceeding, you agree to generate a professional quotation based on the items listed above.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 11,
                      color: AppColors.disabledGrey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    text: 'PROCEED TO FINAL REVIEW',
                    icon: Icons.assignment_turned_in_outlined,
                    onPressed: () => context.push(RouteNames.quotationReview),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}