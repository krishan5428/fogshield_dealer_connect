import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class CatalogProductCard extends StatelessWidget {
  final String name;
  final String model;
  final String coverage;
  final String price;
  final String imagePath;
  final Color? accentColor;

  const CatalogProductCard({
    super.key,
    required this.name,
    required this.model,
    required this.coverage,
    required this.price,
    required this.imagePath,
    this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    final themeColor = accentColor ?? AppColors.colorCompanyPrimary;

    return Expanded(
      child: InkWell(
        onTap: () => context.push(RouteNames.productDetail),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 195, // Slightly taller for the price line
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: themeColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      coverage,
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: themeColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  const Icon(Icons.arrow_outward_rounded, size: 16, color: AppColors.grey),
                ],
              ),
              const Spacer(),
              Center(
                child: Hero(
                  tag: 'catalog_$model',
                  child: Image.asset(
                    imagePath,
                    height: 55,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.shield_rounded,
                      size: 40,
                      color: themeColor.withOpacity(0.2),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 13,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                price,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: themeColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}