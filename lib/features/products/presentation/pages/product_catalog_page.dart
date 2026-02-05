import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/catalog_product_card.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/category_chips.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_search_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/state/product_state.dart';

final searchQueryProvider = StateProvider<String>((ref) => '');

@RoutePage()
class ProductCatalogPage extends ConsumerWidget {
  const ProductCatalogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Watch the API Data (AsyncValue)
    // This will trigger 'loading', 'error', or 'data' states
    final productsAsync = ref.watch(productsProvider);

    final categoryFilter = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Product Catalog'),
      body: Column(
        children: [
          // Header Components (Search & Chips)
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: ProductSearchBar(
              onChanged: (value) {
                ref.read(searchQueryProvider.notifier).state = value;
              },
            ),
          ),
          const CategoryChips(),

          // Body Content: Handles Loading, Error, and Success states
          Expanded(
            child: productsAsync.when(
              // LOADING STATE
              loading: () => const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoadingIndicator(),
                    SizedBox(height: 16),
                    Text('Fetching live prices...', style: TextStyle(color: AppColors.disabledGrey)),
                  ],
                ),
              ),

              // ERROR STATE (Now triggered if API fails)
              error: (err, stack) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.wifi_off_rounded, size: 64, color: AppColors.grey),
                      const SizedBox(height: 16),
                      Text(
                        'Unable to Connect',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        err.toString().replaceAll('Exception: ', ''),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: AppColors.disabledGrey),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () => ref.refresh(productsProvider),
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Retry Connection'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorCompanyPrimary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              // SUCCESS STATE
              data: (allProducts) {
                // Apply Local Filters (Category & Search)
                List<Product> filteredProducts = allProducts;

                if (categoryFilter != 'ALL') {
                  if (categoryFilter == 'SOFTWARE') {
                    filteredProducts = allProducts.where((p) => p.category == 'SOFTWARE' || p.category == 'SERVICE').toList();
                  } else if (categoryFilter == 'ACCESSORY') {
                    filteredProducts = allProducts.where((p) => p.category == 'ACCESSORY').toList();
                  } else if (categoryFilter == 'FLUID') {
                    filteredProducts = allProducts.where((p) => p.category == 'FLUID').toList();
                  } else {
                    filteredProducts = allProducts.where((p) => p.category == categoryFilter).toList();
                  }
                }

                if (searchQuery.isNotEmpty) {
                  filteredProducts = filteredProducts.where((p) {
                    final nameMatch = p.name.toLowerCase().contains(searchQuery);
                    final modelMatch = p.model.toLowerCase().contains(searchQuery);
                    return nameMatch || modelMatch;
                  }).toList();
                }

                if (filteredProducts.isEmpty) {
                  return _buildEmptyState();
                }

                // Partition for sections
                final proSeries = filteredProducts.where((p) => p.category == 'PRO').toList();
                final nexusSeries = filteredProducts.where((p) => p.category == 'NEXUS').toList();
                final accessories = filteredProducts.where((p) => p.category == 'ACCESSORY' || p.category == 'FLUID').toList();
                final software = filteredProducts.where((p) => p.category == 'SOFTWARE' || p.category == 'SERVICE').toList();

                // Pull-to-Refresh Indicator
                return RefreshIndicator(
                  color: AppColors.colorCompanyPrimary,
                  onRefresh: () => ref.refresh(productsProvider.future),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (proSeries.isNotEmpty) ...[
                          _buildSectionHeader('FOGSHIELD PRO SERIES', Icons.bolt_rounded),
                          _buildProductRow(proSeries),
                          const SizedBox(height: 32),
                        ],

                        if (nexusSeries.isNotEmpty) ...[
                          _buildSectionHeader('FOGSHIELD NEXUS SERIES', Icons.auto_awesome_rounded),
                          _buildProductRow(nexusSeries),
                          const SizedBox(height: 32),
                        ],

                        if (accessories.isNotEmpty) ...[
                          _buildSectionHeader('ACCESSORIES & FLUIDS', Icons.settings_input_component_rounded),
                          _buildProductRow(accessories),
                          const SizedBox(height: 32),
                        ],

                        if (software.isNotEmpty) ...[
                          _buildSectionHeader('SOFTWARE & SERVICES', Icons.cloud_done_rounded),
                          _buildProductRow(software),
                          const SizedBox(height: 32),
                        ],

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
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

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search_off_rounded, size: 64, color: AppColors.grey.withOpacity(0.5)),
          const SizedBox(height: 16),
          const Text(
            'No products found matching your search.',
            style: TextStyle(
              color: AppColors.disabledGrey,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}