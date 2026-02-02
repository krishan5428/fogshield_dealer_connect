import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

class ProfilePicturePicker extends ConsumerWidget {
  const ProfilePicturePicker({super.key});

  Future<void> _pickImage(WidgetRef ref) async {
    final ImagePicker picker = ImagePicker();
    try {
      final XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        // Update the provider with the new file path
        ref.read(profileProvider.notifier).updateImage(image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

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
              backgroundImage: getImageProvider(),
              child: profile.profileImage == null
                  ? const Icon(Icons.person, size: 70, color: AppColors.colorAccent)
                  : null,
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: GestureDetector(
              onTap: () => _pickImage(ref),
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