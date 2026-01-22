import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final IconData? icon;
  final bool showDivider;

  const SectionHeader({
    super.key,
    required this.title,
    this.icon,
    this.showDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (showDivider) ...[
          const Divider(height: 32),
          const SizedBox(height: 8),
        ],
        Row(
          children: [
            if (icon != null) ...[
              Icon(icon, size: 20, color: AppColors.colorCompanyPrimary),
              const SizedBox(width: 8),
            ],
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}