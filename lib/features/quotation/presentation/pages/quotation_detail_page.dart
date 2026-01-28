import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_summary.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/share_options_sheet.dart';
import 'package:fogshield_dealer_connect/core/providers/app_database_provider.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

/// Provider to fetch a specific quotation and its items by ID from the database
final quotationDetailProvider = FutureProvider.family<({Quotation quote, List<QuotationItem> items}), String>((ref, id) async {
  final db = ref.watch(databaseProvider);

  // Fetch the main quotation record from the DB
  final quote = await (db.select(db.quotations)..where((t) => t.id.equals(id))).getSingle();

  // Fetch all line items for this specific quotation from the DB
  final items = await db.getItemsForQuotation(id);

  return (quote: quote, items: items);
});

class QuotationDetailPage extends ConsumerWidget {
  final String quotationId;

  const QuotationDetailPage({
    super.key,
    required this.quotationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the database-driven provider
    final detailAsync = ref.watch(quotationDetailProvider(quotationId));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(
        title: 'Quotation Details',
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {
              // Share button logic - shows the same share options sheet
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (context) => const ShareOptionsSheet(),
              );
            },
          ),
        ],
      ),
      body: detailAsync.when(
        data: (data) => _buildDetailContent(context, data.quote, data.items),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline_rounded, color: AppColors.mutedRed, size: 48),
              const SizedBox(height: 16),
              Text('Error loading details: $err'),
              TextButton(
                onPressed: () => ref.refresh(quotationDetailProvider(quotationId)),
                child: const Text('Retry'),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomActions(context),
    );
  }

  Widget _buildDetailContent(BuildContext context, Quotation quote, List<QuotationItem> items) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // COMMENTED OUT PER REQUIREMENT: Real Status Header
          /*
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.grey.withOpacity(0.2)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'CURRENT STATUS',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w900,
                        color: AppColors.disabledGrey,
                        letterSpacing: 0.5,
                      ),
                    ),
                    // Map database status back to UI badge
                    QuotationStatusBadge(status: quote.status),
                  ],
                ),
                const SizedBox(height: 24),
                // Timeline now reflects the actual creation date from DB
                StatusTimeline(
                  createdAt: quote.createdAt,
                  status: quote.status,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          */

          const Text(
            'DOCUMENT OVERVIEW',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w900,
              letterSpacing: 1.0,
              color: AppColors.colorAccent,
            ),
          ),
          const SizedBox(height: 12),

          // These widgets now display data fetched from the DB
          QuotationSummary(
            quotation: quote,
            items: items,
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, -2))
          ]
      ),
      child: Row(
        children: [
          // Removed EDIT QUOTE button per requirement
          Expanded(
            child: CustomButton(
              text: 'VIEW PDF',
              icon: Icons.picture_as_pdf_rounded,
              onPressed: () {
                // Navigate to PDF viewer page
                context.push(RouteNames.quotationPdfViewer);
              },
            ),
          ),
        ],
      ),
    );
  }
}