import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_card.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

// --- PROVIDERS FOR FILTERING ---
// These are autoDispose so filters reset when you leave the page
final productSelectionSearchProvider = StateProvider.autoDispose<String>((ref) => '');
final productFilterPriceRangeProvider = StateProvider.autoDispose<RangeValues>((ref) => const RangeValues(0, 300000));
final productFilterInStockProvider = StateProvider.autoDispose<bool>((ref) => false);

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. Get All Products
    final allProducts = fogShieldProducts;

    // 2. Watch Filter States
    final categoryFilter = ref.watch(selectedCategoryProvider);
    final searchQuery = ref.watch(productSelectionSearchProvider).toLowerCase();
    final priceRange = ref.watch(productFilterPriceRangeProvider);
    final inStockOnly = ref.watch(productFilterInStockProvider);

    // CRITICAL FIX: Watch the cart provider so the grid rebuilds when items are added/removed
    ref.watch(cartProvider);

    // 3. Apply Filtering Logic
    final filteredProducts = allProducts.where((product) {
      // A. Category Filter
      bool categoryMatch = true;
      if (categoryFilter != 'ALL') {
        if (categoryFilter == 'SOFTWARE') {
          // Special case: SOFTWARE chip shows both SOFTWARE and SERVICE categories
          categoryMatch = product.category == 'SOFTWARE' || product.category == 'SERVICE';
        } else {
          categoryMatch = product.category == categoryFilter;
        }
      }

      // B. Search Filter (Name or Model/SKU)
      bool searchMatch = true;
      if (searchQuery.isNotEmpty) {
        searchMatch = product.name.toLowerCase().contains(searchQuery) ||
            product.model.toLowerCase().contains(searchQuery);
      }

      // C. Price Filter
      bool priceMatch = product.endUserPrice >= priceRange.start &&
          product.endUserPrice <= priceRange.end;

      // D. In Stock Filter (Mock logic as Product model doesn't have stockCount yet)
      bool stockMatch = true;
      if (inStockOnly) {
        stockMatch = true;
      }

      return categoryMatch && searchMatch && priceMatch && stockMatch;
    }).toList();

    // 4. Handle Empty State
    if (filteredProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off_rounded, size: 64, color: AppColors.grey.withOpacity(0.5)),
            const SizedBox(height: 16),
            const Text(
              'No products match your filters.',
              style: TextStyle(
                color: AppColors.disabledGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Reset all filters
                ref.read(selectedCategoryProvider.notifier).state = 'ALL';
                ref.read(productSelectionSearchProvider.notifier).state = '';
                ref.read(productFilterPriceRangeProvider.notifier).state = const RangeValues(0, 300000);
              },
              child: const Text('Clear Filters', style: TextStyle(color: AppColors.colorCompanyPrimary)),
            )
          ],
        ),
      );
    }

    // 5. Render Grid
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        // We use read here because we are already watching the entire provider above
        final quantity = ref.read(cartProvider.notifier).getQuantity(product.model);

        return ProductCard(
          product: product,
          quantity: quantity,
          onQuantityChanged: (newQty) {
            ref.read(cartProvider.notifier).updateProductQuantity(
                product: product,
                quantity: newQty
            );
          },
        );
      },
    );
  }
}