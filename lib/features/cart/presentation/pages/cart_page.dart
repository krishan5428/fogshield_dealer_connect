import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/state/cart_state.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/cart_item_card.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/cart_summary.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/widgets/empty_cart_view.dart';
import 'package:fogshield_dealer_connect/core/widgets/delete_confirmation_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  // Mocking cart items with the professional SEC series names
  List<CartItem> _items = [
    CartItem(id: '1', name: 'SEC FSG1B MG4I', sku: 'FS-G1B', price: 75000, quantity: 1),
    CartItem(id: '2', name: 'SEC FSG1E MG4I', sku: 'FS-G1E', price: 125000, quantity: 2),
    CartItem(id: '3', name: 'Fogging Fluid (5L)', sku: 'FS-FL5', price: 3500, quantity: 4),
  ];

  @override
  Widget build(BuildContext context) {
    final subtotal = _items.fold(0.0, (sum, item) => sum + item.total);
    const discount = 2000.0;
    final tax = (subtotal - discount) * 0.18;
    final total = (subtotal - discount) + tax;

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Review Selection'),
      body: _items.isEmpty
          ? const EmptyCartView()
          : SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const StepperIndicator(currentStep: 3),

            // Product List Section
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
                  // List of items - no inner scroll
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return CartItemCard(
                        item: item,
                        onQuantityChanged: (qty) {
                          setState(() {
                            _items[index] = item.copyWith(quantity: qty);
                          });
                        },
                        onDelete: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => DeleteConfirmationDialog(
                              itemName: item.name,
                              onConfirm: () {
                                setState(() => _items.removeAt(index));
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

            // Summary Section - Scrolls with the list
            const SizedBox(height: 8),
            CartSummary(
              subtotal: subtotal,
              discount: discount,
              tax: tax,
              total: total,
            ),

            // Final Action Section
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