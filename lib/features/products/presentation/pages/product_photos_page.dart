import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/photo_grid_item.dart';
import 'package:fogshield_dealer_connect/core/widgets/image_fullscreen_viewer.dart';

class ProductPhotosPage extends StatelessWidget {
  const ProductPhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Media Gallery'),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          final label = 'Fogshield Unit #${index + 1}';
          final path = 'assets/product/foggshield_image_${(index % 6) + 1}.png';

          return PhotoGridItem(
            imagePath: path,
            label: label,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ImageFullscreenViewer(imagePath: path, title: label),
                ),
              );
            },
          );
        },
      ),
    );
  }
}