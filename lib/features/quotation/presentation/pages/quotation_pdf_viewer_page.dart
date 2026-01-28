import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/pdf_service.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_detail_page.dart';
import 'dart:typed_data';

class QuotationPdfViewerPage extends ConsumerWidget {
  final String quotationId;

  const QuotationPdfViewerPage({super.key, required this.quotationId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Reuse the detail provider to get DB data
    final detailAsync = ref.watch(quotationDetailProvider(quotationId));

    return Scaffold(
      appBar: AppBar(title: const Text('Quotation Preview')),
      body: detailAsync.when(
        data: (data) => PdfPreview(
          build: (format) => PdfService.generateQuotationPdfFromDb(data.quote, data.items),
          useActions: true, // Shows standard print/share actions
          canChangePageFormat: false,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}