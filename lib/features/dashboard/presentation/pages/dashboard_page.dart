import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/sidebar_drawer.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/notification_icon.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/greeting_section.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/quick_action_buttons.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/recent_activity.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      drawer: const SidebarDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        surfaceTintColor: AppColors.white,
        shadowColor: AppColors.black.withOpacity(0.05),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppColors.black),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/icons/logo.png',
              height: 28,
              width: 28,
              errorBuilder: (context, error, stackTrace) =>
              const SizedBox(height: 28, width: 28),
            ),
            const SizedBox(width: 8),
            const Text(
              'FogShield',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                letterSpacing: 0.4,
                fontSize: 18,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [
          NotificationIcon(count: 5),
          SizedBox(width: 12),
        ],
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            GreetingSection(),
            SizedBox(height: 28),
            // StatsOverview(),
            // SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            SizedBox(height: 16),
            QuickActionButtons(),
            SizedBox(height: 32),
            RecentActivity(),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
