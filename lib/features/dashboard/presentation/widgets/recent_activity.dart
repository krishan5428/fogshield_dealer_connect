import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/providers/app_database_provider.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_list_item.dart';

class RecentActivity extends ConsumerWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the database stream for all quotations
    final historyAsync = ref.watch(quotationHistoryStreamProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'RECENT QUOTATIONS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: AppColors.colorAccent,
                  letterSpacing: 1.0,
                ),
              ),
              // TextButton(
              //   onPressed: () => context.push(RouteNames.quotationHistory),
              //   style: TextButton.styleFrom(visualDensity: VisualDensity.compact),
              //   child: const Text(
              //     'VIEW HISTORY',
              //     style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
              //   ),
              // ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: historyAsync.when(
            data: (quotations) {
              if (quotations.isEmpty) {
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.grey.withOpacity(0.1)),
                  ),
                  child: const Center(
                    child: Text(
                      'No quotations generated yet.',
                      style: TextStyle(color: AppColors.disabledGrey, fontSize: 13),
                    ),
                  ),
                );
              }

              // Take only the latest 4 quotations
              final recentQuotes = quotations.take(4).toList();

              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: recentQuotes.length,
                itemBuilder: (context, index) {
                  // Reusing the QuotationListItem card component for UI consistency
                  return QuotationListItem(quotation: recentQuotes[index]);
                },
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(32.0),
              child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
            ),
            error: (err, stack) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text('Error loading activity: $err', style: const TextStyle(fontSize: 11)),
            ),
          ),
        ),
      ],
    );
  }
}