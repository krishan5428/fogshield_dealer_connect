import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_header.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/drawer_menu_item.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
                  onTap: () => Navigator.pop(context),
                  isSelected: true,
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.person_outline_rounded,
                  title: 'My Profile',
                  onTap: () => context.push(RouteNames.profile),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.history_rounded,
                  title: 'Quotation History',
                  onTap: () => context.push(RouteNames.quotationHistory),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.inventory_2_outlined,
                  title: 'Product Catalog',
                  onTap: () => context.push(RouteNames.productCatalog),
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
                  onTap: () => context.push(RouteNames.helpSupport),
                ),
                const SizedBox(height: 4),
                DrawerMenuItem(
                  icon: Icons.info_outline_rounded,
                  title: 'About Us',
                  onTap: () => context.push(RouteNames.aboutUs),
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
              onTap: () => context.go(RouteNames.login),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}