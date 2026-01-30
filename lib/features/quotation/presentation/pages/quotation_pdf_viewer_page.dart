import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:printing/printing.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/pdf_service.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/pages/quotation_detail_page.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class QuotationPdfViewerPage extends ConsumerStatefulWidget {
  final String quotationId;

  const QuotationPdfViewerPage({
    super.key,
    required this.quotationId,
  });

  @override
  ConsumerState<QuotationPdfViewerPage> createState() => _QuotationPdfViewerPageState();
}

class _QuotationPdfViewerPageState extends ConsumerState<QuotationPdfViewerPage> {
  Uint8List? _pdfBytes;
  bool _isLoading = true;
  String? _errorMessage;
  final Completer<PDFViewController> _controller = Completer<PDFViewController>();

  @override
  void initState() {
    super.initState();
    _generatePdf();
  }

  /// Generates the PDF bytes from the database data
  Future<void> _generatePdf() async {
    try {
      final detail = await ref.read(quotationDetailProvider(widget.quotationId).future);
      final bytes = await PdfService.generateQuotationPdfFromDb(detail.quote, detail.items);

      if (!mounted) return;

      setState(() {
        _pdfBytes = bytes;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _errorMessage = e.toString();
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.quotationId.isEmpty) {
      return _buildErrorState('Quotation ID is missing.');
    }

    if (_isLoading) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (_errorMessage != null || _pdfBytes == null) {
      return _buildErrorState(_errorMessage ?? 'Failed to generate PDF');
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Quotation Preview'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.print_rounded),
            onPressed: () async {
              await Printing.layoutPdf(onLayout: (format) async => _pdfBytes!);
            },
          ),
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () async {
              await Printing.sharePdf(
                bytes: _pdfBytes!,
                filename: 'Quotation_${widget.quotationId}.pdf',
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: PDFView(
          pdfData: _pdfBytes,
          enableSwipe: true,
          swipeHorizontal: false,
          autoSpacing: true,
          pageFling: true,
          pageSnap: true,
          // Requirement: HD/High Quality. Native renderers handle this automatically.
          // Requirement: Background white.
          backgroundColor: Colors.white,
          // Requirement: Zoomed view by default. FitPolicy.WIDTH ensures it fills width.
          fitPolicy: FitPolicy.WIDTH,
          preventLinkNavigation: false,
          onRender: (pages) {
            debugPrint('PDF Rendered with $pages pages');
          },
          onError: (error) {
            setState(() => _errorMessage = error.toString());
          },
          onPageError: (page, error) {
            debugPrint('Error on page $page: $error');
          },
          onViewCreated: (PDFViewController pdfViewController) {
            _controller.complete(pdfViewController);
          },
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Scaffold(
      appBar: AppBar(title: const Text('Preview Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline_rounded, size: 64, color: AppColors.mutedRed),
            const SizedBox(height: 16),
            const Text(
              'Oops! Could not load PDF.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.disabledGrey),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            )
          ],
        ),
      ),
    );
  }
}