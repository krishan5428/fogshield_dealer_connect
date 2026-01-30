import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_header.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_menu_item.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/providers/auth_providers.dart';

class SidebarDrawer extends ConsumerWidget {
  const SidebarDrawer({super.key});

  // CHANGED: Helper method for simpler navigation calls
  void _navTo(BuildContext context, String routeName) {
    // Close the drawer first
    Navigator.pop(context);
    // Then navigate
    Navigator.pushNamed(context, routeName);
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
                  onTap: () => _navTo(context, RouteNames.profile),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Quotation History',
                  onTap: () => _navTo(context, RouteNames.quotationHistory),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'Product Catalog',
                  onTap: () => _navTo(context, RouteNames.productCatalog),
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
                  onTap: () => _navTo(context, RouteNames.helpSupport),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: 'About Us',
                  onTap: () => _navTo(context, RouteNames.aboutUs),
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
                // Close the drawer
                Navigator.pop(context);
                // Call logout. AuthGate will see the state change and switch the root widget to Login.
                ref.read(authProvider.notifier).logout();
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}