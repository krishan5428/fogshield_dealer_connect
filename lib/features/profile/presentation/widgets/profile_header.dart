import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

class ProfileHeader extends ConsumerWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    ImageProvider? getImageProvider() {
      if (profile.profileImage != null) {
        if (profile.profileImage!.startsWith('assets/')) {
          return AssetImage(profile.profileImage!);
        } else {
          return FileImage(File(profile.profileImage!));
        }
      }
      return null;
    }

    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 100,
              decoration: const BoxDecoration(
                color: AppColors.colorCompanyPrimary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
              ),
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
              child: CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.lightGrey,
                backgroundImage: getImageProvider(),
                child: profile.profileImage == null
                    ? const Icon(Icons.person, size: 70, color: AppColors.colorAccent)
                    : null,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          profile.name,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Authorized Dealer • ID: ${profile.dealerId}',
          style: const TextStyle(
            color: AppColors.disabledGrey,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}