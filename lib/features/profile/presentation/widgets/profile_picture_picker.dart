import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

class ProfilePicturePicker extends ConsumerWidget {
  const ProfilePicturePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);

    return Center(
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.colorCompanyPrimary, width: 2),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: AppColors.lightGrey,
              // BoxFit.cover is used internally by backgroundImage to ensure it fits correctly
              backgroundImage: profile.profileImage != null
                  ? AssetImage(profile.profileImage!)
                  : null,
              child: profile.profileImage == null
                  ? const Icon(Icons.person, size: 70, color: AppColors.colorAccent)
                  : null,
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: GestureDetector(
              onTap: () {
                // In a real device, you'd use image_picker.
                // For this demo, we mock selecting an asset image.
                ref.read(profileProvider.notifier).updateImage('assets/icons/app_icon.png');
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: AppColors.colorCompanyPrimary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))
                  ],
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}