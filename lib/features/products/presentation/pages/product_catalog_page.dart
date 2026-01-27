import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/catalog_product_card.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

class ProductCatalogPage extends StatelessWidget {
  const ProductCatalogPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Categorizing products from the comprehensive list
    final proSeries = fogShieldProducts.where((p) => p.category == 'PRO').toList();
    final nexusSeries = fogShieldProducts.where((p) => p.category == 'NEXUS').toList();
    final accessories = fogShieldProducts.where((p) => p.category == 'ACCESSORY' || p.category == 'FLUID').toList();

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
            _buildProductRow(proSeries),

            const SizedBox(height: 32),
            _buildSectionHeader('FOGSHIELD NEXUS SERIES', Icons.auto_awesome_rounded),
            _buildProductRow(nexusSeries),

            const SizedBox(height: 32),
            _buildSectionHeader('ACCESSORIES & FLUIDS', Icons.settings_input_component_rounded),
            _buildProductRow(accessories),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProductRow(List<Product> products) {
    return Column(
      children: List.generate((products.length / 2).ceil(), (index) {
        final firstIdx = index * 2;
        final secondIdx = firstIdx + 1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              CatalogProductCard(
                name: products[firstIdx].name,
                model: products[firstIdx].model,
                coverage: products[firstIdx].coverage,
                price: products[firstIdx].formattedPrice,
                imagePath: products[firstIdx].imagePath,
              ),
              const SizedBox(width: 12),
              if (secondIdx < products.length)
                CatalogProductCard(
                  name: products[secondIdx].name,
                  model: products[secondIdx].model,
                  coverage: products[secondIdx].coverage,
                  price: products[secondIdx].formattedPrice,
                  imagePath: products[secondIdx].imagePath,
                )
              else
                const Expanded(child: SizedBox()),
            ],
          ),
        );
      }),
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