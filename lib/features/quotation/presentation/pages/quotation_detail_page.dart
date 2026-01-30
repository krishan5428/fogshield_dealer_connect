import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/app/routes/app_router.gr.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_summary.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/share_options_sheet.dart';
import 'package:fogshield_dealer_connect/core/providers/app_database_provider.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

final quotationDetailProvider = FutureProvider.family<({Quotation quote, List<QuotationItem> items}), String>((ref, id) async {
  final db = ref.watch(databaseProvider);
  final quote = await (db.select(db.quotations)..where((t) => t.id.equals(id))).getSingle();
  final items = await db.getItemsForQuotation(id);
  return (quote: quote, items: items);
});

@RoutePage()
class QuotationDetailPage extends ConsumerWidget {
  final String quotationId;

  const QuotationDetailPage({
    super.key,
    required this.quotationId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailAsync = ref.watch(quotationDetailProvider(quotationId));

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(
        title: 'Quotation Details',
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {
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
          Expanded(
            child: CustomButton(
              text: 'VIEW PDF',
              icon: Icons.picture_as_pdf_rounded,
              onPressed: () {
                context.router.push(QuotationPdfViewerRoute(quotationId: quotationId));
              },
            ),
          ),
        ],
      ),
    );
  }
}