import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/catalog_product_card.dart';

class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Product Catalog'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('FOGSHIELD PRO SERIES', Icons.bolt_rounded),
            Row(
              children: const [
                CatalogProductCard(
                  name: 'Pro 7000',
                  model: 'SEC FSG1B MG4I',
                  coverage: '7,000 ft³',
                  imagePath: 'assets/product/foggshield_image_1.png',
                ),
                SizedBox(width: 12),
                CatalogProductCard(
                  name: 'Pro 17500',
                  model: 'SEC FSG1E MG4I',
                  coverage: '17,500 ft³',
                  imagePath: 'assets/product/foggshield_image_2.png',
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: const [
                CatalogProductCard(
                  name: 'Pro 28000',
                  model: 'SEC FSG1H MG4I',
                  coverage: '28,000 ft³',
                  imagePath: 'assets/product/foggshield_image_3.png',
                ),
                SizedBox(width: 12),
                CatalogProductCard(
                  name: 'Pro 4590',
                  model: 'SEC FSG1A MG4I',
                  coverage: '4,590 ft³',
                  imagePath: 'assets/product/foggshield_image_4.png',
                ),
              ],
            ),

            const SizedBox(height: 32),
            _buildSectionHeader('FOGSHIELD NEXUS (INTEGRATED)', Icons.hub_rounded),
            Row(
              children: const [
                CatalogProductCard(
                  name: 'Nexus 4590',
                  model: 'SEC FSAG1A MG4I',
                  coverage: '4,590 ft³',
                  imagePath: 'assets/product/foggshield_image_5.png',
                  accentColor: Colors.blueAccent,
                ),
                SizedBox(width: 12),
                CatalogProductCard(
                  name: 'Nexus 3530',
                  model: 'SEC FSAG2A MG4I',
                  coverage: '3,530 ft³',
                  imagePath: 'assets/product/foggshield_image_6.png',
                  accentColor: Colors.blueAccent,
                ),
              ],
            ),

            const SizedBox(height: 32),
            _buildSectionHeader('FOGGING FLUIDS', Icons.water_drop_rounded),
            Row(
              children: const [
                CatalogProductCard(
                  name: 'Fluid 1000ml',
                  model: 'Food Grade',
                  coverage: 'Premium',
                  imagePath: 'assets/product/foggshield_image_2.png',
                  accentColor: Colors.teal,
                ),
                SizedBox(width: 12),
                CatalogProductCard(
                  name: 'Fluid 750ml',
                  model: 'Food Grade',
                  coverage: 'Standard',
                  imagePath: 'assets/product/foggshield_image_2.png',
                  accentColor: Colors.teal,
                ),
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 18, color: AppColors.colorCompanyPrimary),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.2,
              color: AppColors.colorAccent,
            ),
          ),
        ],
      ),
    );
  }
}