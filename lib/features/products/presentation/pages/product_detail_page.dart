import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_image_carousel.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/quantity_selector.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // For this demonstration, we'll use data from the Pro 7000 (S.No 2 in CSV)
    final String productName = 'FogSHIELD Pro 7000 ft³';
    final String modelCode = 'SEC FSG1B MG4I';
    final String description = 'IOT Fogging System Fog Generator. Suitable for fogging up to appx 7000 cubic feet volume with less than 1m visibility. Inbuilt multi-communication channel GSM, 4G & IP';
    final String warranty = '1 YEAR WARRANTY';
    final String endUserPrice = '₹1,19,872';
    final String mrp = '₹1,41,449';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Product Details'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImageCarousel(
              images: [
                'assets/product/foggshield_image_1.png',
                'assets/product/foggshield_image_2.png',
                'assets/product/foggshield_image_3.png',
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
                              productName.toUpperCase(),
                              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, letterSpacing: -0.5),
                            ),
                            Text(
                              modelCode,
                              style: const TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.w600, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
                        child: const Text('IN STOCK', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w900)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // PRICING SECTION (End User Only)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('END USER PRICE', style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, color: AppColors.colorAccent)),
                          Text(endUserPrice, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: AppColors.colorCompanyPrimary)),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          'MRP: $mrp',
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
                  _buildDetailItem(Icons.verified_user_rounded, warranty),
                  _buildDetailItem(Icons.info_outline_rounded, description),
                  _buildDetailItem(Icons.bolt_rounded, 'Coverage: 7,000 Cubic Feet'),
                  _buildDetailItem(Icons.cloud_done_rounded, 'Communication: GSM, 4G & IP Inbuilt'),

                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('QUANTITY', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
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
                    text: 'TECHNICAL DATASHEET',
                    isOutlined: true,
                    onPressed: () {},
                    icon: Icons.file_download_outlined,
                  ),
                  const SizedBox(height: 40),
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