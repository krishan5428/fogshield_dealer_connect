import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/widgets/offer_card.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/state/offer_state.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Real-time data simulation with unique values for each offer
    final List<Offer> availableOffers = [
      Offer(
        id: '1',
        title: 'Bulk Fogging Fluid',
        description: 'Buy 10 barrels of 5L fluid and get 15% discount.',
        discount: '15%',
        code: 'BULKFIG15',
        expiryDate: DateTime.now().add(const Duration(days: 2)),
        terms: [
          'Applicable only on orders above 10 units.',
          'Cannot be combined with other dealer points.',
          'Validity: 22nd Jan - 15th Feb 2026.',
          'Stock availability depends on regional hub.',
        ],
      ),
      Offer(
        id: '2',
        title: 'Nexus Upgrade',
        description: 'Exchange old SEC-G1 units for the new Nexus MG4I.',
        discount: '₹5,000',
        code: 'NEXUSUP',
        bannerTitle: 'LOYALTY UPGRADE',
        expiryDate: DateTime.now().add(const Duration(days: 5)),
        terms: [
          'Valid on exchange of FSG1 series units.',
          'Old unit must be in working condition.',
          'Discount credited after physical audit by technician.',
        ],
      ),
      Offer(
        id: '3',
        title: 'Early Bird Stock',
        description: 'Pre-order 2026 units before Feb 15th.',
        discount: '10%',
        code: 'EBIRD26',
        bannerTitle: 'SEASONAL INCENTIVE',
        expiryDate: DateTime.now().add(const Duration(days: 10)),
        terms: [
          '10% Flat off on total cart value.',
          'Minimum order quantity of 5 units.',
          'Full payment must be cleared by Feb 20th.',
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Special Incentives'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemCount: availableOffers.length,
        itemBuilder: (context, index) {
          final offer = availableOffers[index];
          return OfferCard(
            title: offer.title,
            description: offer.description,
            discount: offer.discount,
            code: offer.code,
            expiryDate: offer.expiryDate,
            // Passing the specific offer object to the detail page
            onTap: () => context.push(RouteNames.offerDetail, extra: offer),
          );
        },
      ),
    );
  }
}