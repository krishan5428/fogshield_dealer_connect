import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_card.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

class ProductGrid extends ConsumerWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Dynamically uses the full list from product_model.dart
    final products = fogShieldProducts;

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        final quantity = ref.watch(cartProvider.notifier).getQuantity(product.model);

        return ProductCard(
          name: '${product.name} (${product.model})',
          price: product.formattedPrice,
          imagePath: product.imagePath,
          quantity: quantity,
          onQuantityChanged: (newQty) {
            // Using updateProductQuantity to keep code clean
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