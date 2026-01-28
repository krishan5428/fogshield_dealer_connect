import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

class GreetingSection extends ConsumerWidget {
  const GreetingSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// Watch the profile provider to get the actual user name
    final profile = ref.watch(profileProvider);

    final hour = DateTime.now().hour;
    String greeting;
    IconData greetingIcon;

    if (hour < 12) {
      greeting = 'Good Morning';
      greetingIcon = Icons.wb_sunny_rounded;
    } else if (hour < 17) {
      greeting = 'Good Afternoon';
      greetingIcon = Icons.wb_sunny_outlined;
    } else {
      greeting = 'Good Evening';
      greetingIcon = Icons.nights_stay_rounded;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF2D2D2D),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      greetingIcon,
                      color: AppColors.white.withOpacity(0.7),
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      greeting,
                      style: TextStyle(
                        color: AppColors.white.withOpacity(0.7),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Display the dynamic name from the profile state
                Text(
                  profile.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Welcome to FogShield Partner App',
                  style: TextStyle(
                    color: AppColors.white.withOpacity(0.65),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );


  }
}