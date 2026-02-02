import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/sidebar_drawer.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/notification_icon.dart';
import 'package:fogshield_dealer_connect/features/admin/presentation/widgets/admin_action_buttons.dart';
import 'package:fogshield_dealer_connect/features/admin/presentation/widgets/admin_quotations_list.dart';

@RoutePage()
class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({super.key});

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
        title: const Text(
          'Admin Console',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            letterSpacing: 0.4,
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        actions: const [
          NotificationIcon(count: 2),
          SizedBox(width: 12),
        ],
      ),
      body: const SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Management Tools',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.black,
                  letterSpacing: 0.2,
                ),
              ),
            ),
            SizedBox(height: 16),
            AdminActionButtons(),
            SizedBox(height: 32),
            AdminQuotationsList(), // "All Quotations Made" list
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}