import 'package:flutter/material.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';

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
              'assets/icons/app_icon.png',
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
            // Condensed Text Section
            const Text(
              'FogSHIELD is Securico’s next-gen IoT fogging ecosystem, engineered in India to stop intrusions instantly by eliminating visibility in seconds. Combining 40 years of security expertise with world-class UR Fog fluid, it provides ultimate physical deterrence with seamless app control.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6),
            ),
            const SizedBox(height: 16),
            const Text(
              'Built for Indian conditions, FogSHIELD is the trusted choice for banks, retail, and high-risk environments across the nation.',
              textAlign: TextAlign.center,
              style: TextStyle(height: 1.6, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 32),
            const Text(
              'Follow Us',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 16),
            // Corrected Mini Social Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  Buttons.facebook, // Changed from facebookNew to support mini mode
                  mini: true,
                  onPressed: () {
                    // TODO: Link to Facebook page
                  },
                ),
                const SizedBox(width: 12),
                SignInButton(
                  Buttons.linkedIn,
                  mini: true,
                  onPressed: () {
                    // TODO: Link to LinkedIn profile
                  },
                ),
                const SizedBox(width: 12),
                SignInButton(
                  Buttons.twitter,
                  mini: true,
                  onPressed: () {
                    // TODO: Link to Twitter/X profile
                  },
                ),
              ],
            ),
            const SizedBox(height: 48),
            const Divider(),
            const SizedBox(height: 16),
            const Text(
              '© 2026 Fogshield Global Inc. All Rights Reserved.',
              style: TextStyle(fontSize: 12, color: AppColors.disabledGrey),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}