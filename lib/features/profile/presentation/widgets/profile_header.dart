import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  final String name;
  final String subtitle;
  final String? imageUrl;

  const ProfileHeader({
    super.key,
    required this.name,
    required this.subtitle,
    this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 120,
              // decoration: const BoxDecoration(
              //   color: AppColors.colorCompanyPrimary,
              //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              // ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.white, width: 4),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: const CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.lightGrey,
                child: Icon(Icons.person, size: 70, color: AppColors.colorAccent),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: AppColors.disabledGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}