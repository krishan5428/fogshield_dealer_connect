import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/widgets/offer_card.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Special Incentives'),
      body: ListView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        children: [
          OfferCard(
            title: 'Bulk Fogging Fluid',
            description: 'Buy 10 barrels of 5L fluid and get 15% discount.',
            discount: '15%',
            code: 'BULKFIG15',
            expiryDate: DateTime.now().add(const Duration(days: 2)),
            onTap: () => context.push(RouteNames.offerDetail),
          ),
          OfferCard(
            title: 'Nexus Upgrade',
            description: 'Exchange old SEC-G1 units for the new Nexus MG4I.',
            discount: '₹5k',
            code: 'NEXUSUP',
            expiryDate: DateTime.now().add(const Duration(days: 5)),
            onTap: () => context.push(RouteNames.offerDetail),
          ),
          OfferCard(
            title: 'Early Bird Stock',
            description: 'Pre-order 2026 units before Feb 15th.',
            discount: '10%',
            code: 'EBIRD26',
            expiryDate: DateTime.now().add(const Duration(days: 10)),
            onTap: () => context.push(RouteNames.offerDetail),
          ),
        ],
      ),
    );
  }
}