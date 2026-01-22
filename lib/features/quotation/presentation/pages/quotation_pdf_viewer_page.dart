import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/pdf_preview_widget.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/share_options_sheet.dart';
import 'package:fogshield_dealer_connect/core/widgets/zoom_controls.dart';
import 'package:fogshield_dealer_connect/core/widgets/pdf_page_indicator.dart';

class QuotationPdfViewerPage extends StatelessWidget {
  const QuotationPdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'QT-2026-0082',
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (context) => const ShareOptionsSheet(),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.download_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: const Stack(
        children: [
          PdfPreviewWidget(),
          Positioned(
            right: 16,
            bottom: 100,
            child: ZoomControls(
              onZoomIn: _mockAction,
              onZoomOut: _mockAction,
              onReset: _mockAction,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 32,
            child: Center(
              child: PdfPageIndicator(
                currentPage: 1,
                totalPages: 3,
                onPrevious: _mockAction,
                onNext: _mockAction,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void _mockAction() {}
}