import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_header.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_menu_item.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';

class SidebarDrawer extends ConsumerWidget {
  const SidebarDrawer({super.key});

  // Helper method for AutoRoute navigation
  void _navTo(BuildContext context, PageRouteInfo route) {
    // Close the drawer first
    Navigator.pop(context);
    // Then navigate using AutoRoute
    context.router.push(route);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: 280,
      child: Column(
        children: [
          const CustomDrawerHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              children: [
                DrawerMenuItem(
                  icon: Icons.dashboard_outlined,
                  title: 'Dashboard',
                  onTap: () => Navigator.pop(context), // Just close drawer
                  isSelected: true,
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.person_outline_rounded,
                  title: 'My Profile',
                  onTap: () => _navTo(context, const ProfileRoute()),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Quotation History',
                  // FIXED: Now navigating to QuotationHistoryRoute using context.router
                  onTap: () => _navTo(context, const QuotationHistoryRoute()),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'Product Catalog',
                  onTap: () => _navTo(context, const ProductCatalogRoute()),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                    color: AppColors.grey.withOpacity(0.2),
                  ),
                ),
                DrawerMenuItem(
                  icon: Icons.help_outline_rounded,
                  title: 'Help & Support',
                  onTap: () => _navTo(context, const HelpSupportRoute()),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: 'About Us',
                  onTap: () => _navTo(context, const AboutUsRoute()),
                ),
              ],
            ),
          ),
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.grey.withOpacity(0.2),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: DrawerMenuItem(
              icon: Icons.logout_rounded,
              title: 'Logout',
              textColor: const Color(0xFF8B0000),
              iconColor: const Color(0xFF8B0000),
              onTap: () {
                Navigator.pop(context);
                ref.read(authProvider.notifier).logout();
                // Redirecting to login manually just in case
                context.router.replaceAll([const LoginRoute()]);
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}