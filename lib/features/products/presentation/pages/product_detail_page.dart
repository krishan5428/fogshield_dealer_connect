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
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Product Details'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductImageCarousel(
              images: const [
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
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.greenBg.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'IN STOCK',
                          style: TextStyle(color: Colors.green, fontSize: 10, fontWeight: FontWeight.w900),
                        ),
                      ),
                      const Text(
                        'Ref: #SEC-FSG',
                        style: TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.w800, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'SEC FSG1B MG4I Fogshield',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w900,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    '₹45,200',
                    style: TextStyle(
                      color: AppColors.colorCompanyPrimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'TECHNICAL DESCRIPTION',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: AppColors.colorAccent, letterSpacing: 1.0),
                  ),
                  const SizedBox(height: 16),
                  _buildDetailItem(Icons.settings_overscan_rounded, 'Coverage: Up to 7,000 ft³'),
                  _buildDetailItem(Icons.storefront_rounded, 'Compact, powerful and ideal for small shops, homes, offices, cabins and kiosks.'),
                  _buildDetailItem(Icons.water_drop_outlined, '500 ml fluid'),
                  _buildDetailItem(Icons.timer_outlined, '1–28 sec programmable fog emission'),
                  _buildDetailItem(Icons.cell_tower_rounded, 'IoT control + 4G GSM + IP'),
                  const SizedBox(height: 32),
                  const Divider(),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Select Quantity',
                        style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                      ),
                      QuantitySelector(
                        onChanged: (qty) {},
                      ),
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
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}