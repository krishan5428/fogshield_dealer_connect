import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:printing/printing.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/pdf_service.dart';
import 'dart:typed_data';

class QuotationPdfViewerPage extends ConsumerWidget {
  const QuotationPdfViewerPage({super.key});

  Future<void> _handlePrint(Uint8List bytes) async {
    await Printing.layoutPdf(onLayout: (format) => bytes);
  }

  Future<void> _handleShare(Uint8List bytes) async {
    await Printing.sharePdf(bytes: bytes, filename: 'quotation.pdf');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final formState = ref.watch(quotationFormProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quotation Preview'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () async {
              final bytes = await PdfService.generateQuotationPdf(formState, cartState);
              await _handlePrint(bytes);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              final bytes = await PdfService.generateQuotationPdf(formState, cartState);
              await _handleShare(bytes);
            },
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => PdfService.generateQuotationPdf(formState, cartState),
        useActions: false,
        canChangePageFormat: false,
        canChangeOrientation: false,
        canDebug: false,
        pdfPreviewPageDecoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
      ),
    );
  }
}