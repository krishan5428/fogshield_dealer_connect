import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_image_carousel.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/quantity_selector.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final bool showQuotationActions; // New flag to control visibility

  const ProductDetailPage({
    super.key,
    required this.product,
    this.showQuotationActions = false, // Defaults to false for catalog/sidebar view
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: product.name),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageCarousel(
              images: [
                product.imagePath,
                'assets/product/foggshield_image_1.png', // Secondary view mockup
              ],
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
                              product.name.toUpperCase(),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.5),
                            ),
                            Text(
                              product.model,
                              style: const TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                        child: const Text('AVAILABLE', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
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
                          Text(product.formattedPrice, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.colorCompanyPrimary)),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'MRP: ${product.formattedMrp}',
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
                  _buildDetailItem(Icons.verified_user_rounded, 'Warranty: ${product.warranty} Year(s)'),
                  _buildDetailItem(Icons.info_outline_rounded, product.description),
                  _buildDetailItem(Icons.bolt_rounded, 'Coverage Area: ${product.coverage}'),
                  _buildDetailItem(Icons.category_rounded, 'Category: ${product.category} Series'),

                  // Conditional Section for Quotation Flow
                  if (showQuotationActions) ...[
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ORDER QUANTITY', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
                        QuantitySelector(onChanged: (qty) {}),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomButton(
                      text: 'ADD TO QUOTATION',
                      onPressed: () => Navigator.pop(context),
                      icon: Icons.add_chart_rounded,
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      text: 'DOWNLOAD DATASHEET',
                      isOutlined: true,
                      onPressed: () {},
                      icon: Icons.file_download_outlined,
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