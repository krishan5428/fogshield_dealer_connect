import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class ProductImageCarousel extends StatefulWidget {
  final List<String> images;
  final double height;

  const ProductImageCarousel({
    super.key,
    required this.images,
    this.height = 300,
  });

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.images;

    // ✅ If no images passed, show fallback
    if (images.isEmpty) {
      return Container(
        height: widget.height,
        width: double.infinity,
        color: AppColors.lightGrey,
        alignment: Alignment.center,
        child: const Icon(
          Icons.broken_image_outlined,
          size: 80,
          color: AppColors.grey,
        ),
      );
    }

    return Container(
      height: widget.height,
      width: double.infinity,
      color: AppColors.lightGrey,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.lightGrey,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.broken_image_outlined,
                          size: 80,
                          color: AppColors.grey,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),

          // ✅ Dots
          Positioned(
            bottom: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (index) => _buildDot(index)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot(int index) {
    final isActive = _currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 8,
      width: isActive ? 24 : 8,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(
        color: isActive ? AppColors.colorCompanyPrimary : AppColors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
