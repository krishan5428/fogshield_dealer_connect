import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/profile_header.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/profile_info_card.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'My Profile'),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0),
        child: Column(
          children: [
            const ProfileHeader(
              name: 'John Doe',
              subtitle: 'Authorized Dealer • ID: FS-8821',
            ),
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
                  const ProfileInfoCard(
                    icon: Icons.email_outlined,
                    label: 'Email',
                    value: 'john.doe@dealership.com',
                  ),
                  const ProfileInfoCard(
                    icon: Icons.phone_android_outlined,
                    label: 'Phone',
                    value: '+91 98765 43210',
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Business Details',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  const ProfileInfoCard(
                    icon: Icons.business_outlined,
                    label: 'Company Name',
                    value: 'Doe Automobile Solutions',
                  ),
                  const ProfileInfoCard(
                    icon: Icons.receipt_long_outlined,
                    label: 'GST Number',
                    value: '07AAAAA0000A1Z5',
                  ),
                  const ProfileInfoCard(
                    icon: Icons.location_on_outlined,
                    label: 'Address',
                    value: '123, Dealer Hub, Sector 18, Gurugram, Haryana',
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