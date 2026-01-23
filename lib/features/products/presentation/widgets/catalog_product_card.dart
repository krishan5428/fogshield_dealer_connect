import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class CatalogProductCard extends StatelessWidget {
  final String name;
  final String model;
  final String coverage;
  final String imagePath;
  final Color? accentColor;

  const CatalogProductCard({
    super.key,
    required this.name,
    required this.model,
    required this.coverage,
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
          height: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 12,
                offset: const Offset(0, 6),
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
                      coverage.toUpperCase(),
                      style: TextStyle(
                        fontSize: 9,
                        fontWeight: FontWeight.w900,
                        color: themeColor,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_outward_rounded, size: 16, color: AppColors.grey),
                ],
              ),
              const Spacer(),
              Center(
                child: Hero(
                  tag: 'catalog_$model',
                  child: Image.asset(
                    imagePath,
                    height: 60,
                    errorBuilder: (context, error, stackTrace) => Icon(
                      Icons.shield_rounded,
                      size: 50,
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
                  fontSize: 14,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                model,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: AppColors.disabledGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}