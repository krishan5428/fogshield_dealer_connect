import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/profile_header.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// Watch the profile provider for real-time updates
    final profile = ref.watch(profileProvider);

    return Scaffold(
      appBar: const CustomAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Column(
          children: [
            // ProfileHeader now fetches its own data from profileProvider
            const ProfileHeader(),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Personal Information',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ProfileInfoCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: profile.email,
                  ),
                  ProfileInfoCard(
                    icon: Icons.phone_android_outlined,
                    label: 'Phone',
                    value: '+91 ${profile.phone}',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Business Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  ProfileInfoCard(
                    icon: Icons.business_outlined,
                    label: 'Company Name',
                    value: profile.companyName,
                  ),
                  const ProfileInfoCard(
                    icon: Icons.receipt_long_outlined,
                    label: 'GST Number',
                    value: '07AAAAA0000A1Z5',
                  ),
                  ProfileInfoCard(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value: profile.address,
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    text: 'EDIT PROFILE',
                    onPressed: () => context.push(RouteNames.editProfile),
                    icon: Icons.edit_outlined,
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    text: 'CHANGE PASSWORD',
                    isOutlined: true,
                    onPressed: () {
                      // Logic for change password dialog
                    },
                    icon: Icons.lock_reset_outlined,
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}