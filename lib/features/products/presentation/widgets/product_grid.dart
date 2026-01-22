import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_card.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Defined product names as requested
    final List<String> productNames = [
      'SEC FSG1B MG4I - 7,000 ft³',
      'SEC FSG1E MG4I - 9,000 ft³',
      'SEC FSG1H MG4I - 11,000 ft³',
      'SEC FSG1A MG4I - 13,000 ft³',
      'SEC FSAG1A MG4I - 15,000 ft³',
      'SEC FSAG2A MG4I - 20,000 ft³',
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      itemCount: productNames.length,
      itemBuilder: (context, index) {
        return ProductCard(
          name: productNames[index],
          price: '₹${(index + 6) * 12500}', // Mock dynamic price
          imagePath: 'assets/product/foggshield_image_${index + 1}.png',
        );
      },
    );
  }
}