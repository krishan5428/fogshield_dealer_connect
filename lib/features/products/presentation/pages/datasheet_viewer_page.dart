import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/pdf_preview_widget.dart';
import 'package:fogshield_dealer_connect/core/widgets/zoom_controls.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class DatasheetViewerPage extends StatelessWidget {
  const DatasheetViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Document Viewer',
        actions: [
          IconButton(icon: const Icon(Icons.share_rounded), onPressed: () {}),
          IconButton(icon: const Icon(Icons.print_rounded), onPressed: () {}),
        ],
      ),
      body: const Stack(
        children: [
          PdfPreviewWidget(),
          Positioned(
            right: 16,
            bottom: 32,
            child: ZoomControls(
              onZoomIn: _mock,
              onZoomOut: _mock,
              onReset: _mock,
            ),
          ),
        ],
      ),
    );
  }

  static void _mock() {}
}