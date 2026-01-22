import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/brochure_card.dart';

class BrochuresPage extends StatelessWidget {
  const BrochuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Marketing Materials'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: Text(
              'AUTHORIZED BROCHURES',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w900, letterSpacing: 1.2, color: AppColors.colorAccent),
            ),
          ),
          BrochureCard(
            title: 'fogshield 2026 Catalog',
            description: 'Comprehensive guide to our latest surface protection units and IoT integrations.',
            imagePath: '',
            onTap: () {},
          ),
          BrochureCard(
            title: 'Maintenance Guide',
            description: 'Best practices for dealer technicians on maintaining Fogshield Nexus units.',
            imagePath: '',
            onTap: () {},
          ),
          BrochureCard(
            title: 'Consumer Safety Flyer',
            description: 'Customer-facing document highlighting the safety of our proprietary fogging fluid.',
            imagePath: '',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}