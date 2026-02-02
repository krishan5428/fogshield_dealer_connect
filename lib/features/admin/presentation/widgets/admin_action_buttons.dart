import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class AdminActionButtons extends StatelessWidget {
  const AdminActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 1.3,
        children: [
          _AdminCard(
            label: 'Update Product\nPrice',
            icon: Icons.price_change_outlined,
            color: const Color(0xFF2563EB), // Blue
            onTap: () {
              // TODO: Navigate to Update Price Page
            },
          ),
          _AdminCard(
            label: 'Add New\nDealer',
            icon: Icons.person_add_alt_1_outlined,
            color: const Color(0xFF059669), // Green
            onTap: () {
              // TODO: Navigate to Add Dealer Page
            },
          ),
          _AdminCard(
            label: 'Make New\nNotification',
            icon: Icons.notification_add_outlined,
            color: const Color(0xFFD97706), // Amber
            onTap: () {
              // TODO: Navigate to Create Notification Page
            },
          ),
          _AdminCard(
            label: 'Add New\nOffer',
            icon: Icons.local_offer_outlined,
            color: const Color(0xFF7C3AED), // Purple
            onTap: () {
              // TODO: Navigate to Add Offer Page
            },
          ),
        ],
      ),
    );
  }
}

class _AdminCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _AdminCard({
    required this.label,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.grey.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withOpacity(0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(height: 12),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}