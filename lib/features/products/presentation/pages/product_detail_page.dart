import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
// import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_image_carousel.dart'; // Removed as we are using single image view
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/quantity_selector.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final Product product;
  final bool showQuotationActions;

  const ProductDetailPage({
    super.key,
    required this.product,
    this.showQuotationActions = false,
  });

  @override
  ConsumerState<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  int _quantity = 1;
  bool _isInitialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Initialize quantity from cart only once when page loads
    if (!_isInitialized) {
      final cartQty = ref.read(cartProvider.notifier).getQuantity(widget.product.model);
      // If item is in cart, use that quantity. If not, default to 1.
      _quantity = cartQty > 0 ? cartQty : 0;
      _isInitialized = true;
    }
  }

  // Helper to update cart immediately
  void _updateCart(int qty) {
    ref.read(cartProvider.notifier).updateProductQuantity(
      product: widget.product,
      quantity: qty,
    );
  }

  void _onConfirmSelection() {
    // Ensure the current quantity is set (handles the case where user accepts default '1' without changing selector)
    _updateCart(_quantity);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: widget.product.name),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fixed: Removed zoom gesture and carousel dots (pill)
            // Showing a static container since there is only one image
            Container(
              height: 300,
              width: double.infinity,
              color: AppColors.lightGrey,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.product.imagePath,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          size: 80,
                          color: AppColors.grey,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name.toUpperCase(),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.5),
                            ),
                            Text(
                              widget.product.model,
                              style: const TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      // Made badge smaller
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(6)),
                        child: const Text('AVAILABLE', style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // PRICING SECTION
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('END USER PRICE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.colorAccent)),
                          Text(widget.product.formattedPrice, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.colorCompanyPrimary)),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'MRP: ${widget.product.formattedMrp}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColors.disabledGrey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Divider(height: 1),
                  const SizedBox(height: 24),

                  const Text('SPECIFICATIONS', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: AppColors.colorAccent)),
                  const SizedBox(height: 16),
                  _buildDetailItem(Icons.verified_user_rounded, 'Warranty: ${widget.product.warranty} Year(s)'),
                  _buildDetailItem(Icons.info_outline_rounded, widget.product.description),
                  _buildDetailItem(Icons.bolt_rounded, 'Coverage Area: ${widget.product.coverage}'),
                  _buildDetailItem(Icons.category_rounded, 'Category: ${widget.product.category} Series'),

                  // Conditional Section for Quotation Flow
                  if (widget.showQuotationActions) ...[
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ORDER QUANTITY', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                        QuantitySelector(
                          initialValue: _quantity,
                          onChanged: (qty) {
                            setState(() {
                              _quantity = qty;
                            });
                            // LIVE UPDATE: Update cart immediately on quantity change
                            _updateCart(qty);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'ADD TO QUOTATION',
                      onPressed: _onConfirmSelection,
                      icon: Icons.add_chart_rounded,
                    ),
                    const SizedBox(height: 40),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: AppColors.colorCompanyPrimary),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: AppColors.black, fontSize: 14, fontWeight: FontWeight.w500, height: 1.4),
            ),
          ),
        ],
      ),
    );
  }
}