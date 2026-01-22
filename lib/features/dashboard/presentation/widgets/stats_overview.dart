import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/features/dashboard/presentation/widgets/dashboard_card.dart';

class StatsOverview extends StatelessWidget {
  const StatsOverview({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardHeight = 78; // compact height
    const double gap = 12;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: cardHeight,
                  child: DashboardCard(
                    title: 'Total',
                    value: '124',
                    icon: Icons.receipt_long_outlined,
                    color: const Color(0xFF2C2C2C),
                  ),
                ),
              ),
              const SizedBox(width: gap),
              Expanded(
                child: SizedBox(
                  height: cardHeight,
                  child: DashboardCard(
                    title: 'Pending',
                    value: '12',
                    icon: Icons.schedule_rounded,
                    color: const Color(0xFF3D3D3D),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: gap),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: cardHeight,
                  child: DashboardCard(
                    title: 'Completed',
                    value: '102',
                    icon: Icons.trending_up_rounded,
                    color: const Color(0xFF1A1A1A),
                  ),
                ),
              ),
              const SizedBox(width: gap),
              Expanded(
                child: SizedBox(
                  height: cardHeight,
                  child: DashboardCard(
                    title: 'Total Revenue',
                    value: '₹4.2L',
                    icon: Icons.account_balance_wallet_outlined,
                    color: const Color(0xFF4A4A4A),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
