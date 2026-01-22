import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/shimmer_loading.dart';

class ProductSkeleton extends StatelessWidget {
  const ProductSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: const Row(
        children: [
          ShimmerWidget.rectangular(height: 70, width: 70),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(height: 16, width: 150),
                SizedBox(height: 8),
                ShimmerWidget.rectangular(height: 12, width: 100),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerWidget.rectangular(height: 20, width: 60),
                    ShimmerWidget.rectangular(height: 30, width: 80),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}