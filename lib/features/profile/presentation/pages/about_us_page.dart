import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/social_media_links.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 140,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.shield_rounded,
                size: 100,
                color: AppColors.colorCompanyPrimary,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'FOGSHIELD',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w900,
                letterSpacing: 2,
                color: AppColors.colorCompanyPrimary,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Next Generation Surface Protection',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.disabledGrey,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'FogSHIELD is Securico’s next-generation IoT fogging ecosystem — engineered to stop intrusions instantly by eliminating visibility within seconds.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6),
            ),
            const SizedBox(height: 32),
            const Text(
              'Follow Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            const SocialMediaLinks(),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              '© 2026 Fogshield Global Inc. All Rights Reserved.',
              style: TextStyle(fontSize: 12, color: AppColors.disabledGrey),
            ),
            const SizedBox(height: 8),
            // const Text(
            //   'Made with ❤️ for our Dealer Partners',
            //   style: TextStyle(fontSize: 12, color: AppColors.disabledGrey),
            // ),
          ],
        ),
      ),
    );
  }
}