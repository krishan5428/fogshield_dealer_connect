import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/catalog_product_card.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/category_chips.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_search_bar.dart';

class ProductCatalogPage extends ConsumerWidget {
  const ProductCatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the selected category from chips
    final filter = ref.watch(selectedCategoryProvider);

    // Filter categories based on selection
    final proSeries = fogShieldProducts.where((p) => p.category == 'PRO').toList();
    final nexusSeries = fogShieldProducts.where((p) => p.category == 'NEXUS').toList();
    final accessories = fogShieldProducts.where((p) => p.category == 'ACCESSORY' || p.category == 'FLUID').toList();
    final software = fogShieldProducts.where((p) => p.category == 'SOFTWARE' || p.category == 'SERVICE').toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Product Catalog'),
      body: Column(
        children: [
          // Fixed Header Section
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ProductSearchBar(),
          ),
          const CategoryChips(),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logic to show/hide sections based on filter
                  if (filter == 'ALL' || filter == 'PRO') ...[
                    _buildSectionHeader('FOGSHIELD PRO SERIES', Icons.bolt_rounded),
                    _buildProductRow(proSeries),
                    const SizedBox(height: 32),
                  ],

                  if (filter == 'ALL' || filter == 'NEXUS') ...[
                    _buildSectionHeader('FOGSHIELD NEXUS SERIES', Icons.auto_awesome_rounded),
                    _buildProductRow(nexusSeries),
                    const SizedBox(height: 32),
                  ],

                  if (filter == 'ALL' || filter == 'ACCESSORY' || filter == 'FLUID') ...[
                    _buildSectionHeader('ACCESSORIES & FLUIDS', Icons.settings_input_component_rounded),
                    _buildProductRow(accessories),
                    const SizedBox(height: 32),
                  ],

                  if (filter == 'ALL' || filter == 'SOFTWARE') ...[
                    _buildSectionHeader('SOFTWARE & SERVICES', Icons.cloud_done_rounded),
                    _buildProductRow(software),
                    const SizedBox(height: 32),
                  ],

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductRow(List<Product> products) {
    if (products.isEmpty) return const SizedBox();

    return Column(
      children: List.generate((products.length / 2).ceil(), (index) {
        final firstIdx = index * 2;
        final secondIdx = firstIdx + 1;

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Row(
            children: [
              CatalogProductCard(product: products[firstIdx]),
              const SizedBox(width: 12),
              if (secondIdx < products.length)
                CatalogProductCard(product: products[secondIdx])
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