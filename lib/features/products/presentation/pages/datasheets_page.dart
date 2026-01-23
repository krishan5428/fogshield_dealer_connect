import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/datasheet_card.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class DatasheetsPage extends StatelessWidget {
  const DatasheetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of datasheets with Google Drive links
    // Added 'videoUrl' for the demo and kept 'url' for PDFs
    final List<Map<String, String>> datasheets = [
      {
        'title': 'Product Demonstration Video',
        'sku': 'VIDEO-DEMO-01',
        'fileSize': 'Streaming',
        'url': '', // No PDF for this specific card
        'videoUrl': 'https://drive.google.com/file/d/1yZPS8AXLVqoja0wCRPLoFL5xtlMPc2jf/view?usp=drive_link',
      },
      {
        'title': 'Technical Guide SEC-FSAG1A MG4I',
        'sku': 'SEC-FSAG1A-MG4I',
        'fileSize': '2.4 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1po5XS65hytweE9e8syZCg9yqeI3Y3mzQ',
      },
      {
        'title': 'Technical Guide SEC-FSAG2A MG4I',
        'sku': 'SEC-FSAG2A-MG4I',
        'fileSize': '2.1 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1Dw6aqQ3kjTugsnhtNOBEOUul_n7TWs5j',
      },
      {
        'title': 'Technical Guide SEC-FSG1E MG4I',
        'sku': 'SEC-FSG1A-MG4I',
        'fileSize': '2.3 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1D_qxnBNEwITpbVaYNZMYSWch5X2TCZno',
      },
      {
        'title': 'Technical Guide SEC-FSG1B MG4I',
        'sku': 'SEC-FSG1B-MG4I',
        'fileSize': '2.2 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1Ido7H001k_b7h9oniAdxmwr6VTPGUI2_',
      },
      {
        'title': 'Technical Guide SEC-FSG1E MG4I',
        'sku': 'SEC-FSG1E-MG4I',
        'fileSize': '2.5 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1XgYIYvWvr7HQNAEKUWZtcfpDk3hdZn6S',
      },
      {
        'title': 'Technical Guide SEC-FSG1H MG4I',
        'sku': 'SEC-FSG1H-MG4I',
        'fileSize': '2.4 MB',
        'url': 'https://drive.google.com/uc?export=download&id=1lJIY0mVvxpIMVRgJ4plzCwK2AuWsd_xI',
      },
      {
        'title': 'Technical Guide SEC-FSG2A MG4I',
        'sku': 'SEC-FSG2A-MG4I',
        'fileSize': '2.3 MB',
        'url': 'https://drive.google.com/uc?export=download&id=12WwWfcIE2JHthxnx6fvJs36cTOKTOzTR',
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Technical Datasheets'),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemCount: datasheets.length,
        itemBuilder: (context, index) {
          final datasheet = datasheets[index];
          final String? videoUrl = datasheet['videoUrl'];
          final String? pdfUrl = datasheet['url'];

          // Determine if this is a video-only card (no PDF URL)
          final bool isVideoOnly = videoUrl != null && videoUrl.isNotEmpty && (pdfUrl == null || pdfUrl.isEmpty);

          return DatasheetCard(
            title: datasheet['title']!,
            sku: datasheet['sku']!,
            fileSize: datasheet['fileSize']!,
            showOnlyVideo: isVideoOnly,
            onTap: (pdfUrl != null && pdfUrl.isNotEmpty)
                ? () => context.push(RouteNames.datasheetViewer, extra: pdfUrl)
                : () {}, // Empty callback if no PDF
            onDownload: () {
              if (pdfUrl != null && pdfUrl.isNotEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Downloading ${datasheet['title']}...'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: AppColors.colorCompanyPrimary,
                  ),
                );
              }
            },
            onWatchVideo: (videoUrl != null && videoUrl.isNotEmpty)
                ? () => context.push(RouteNames.videoPlayer, extra: videoUrl)
                : null,
          );
        },
      ),
    );
  }
}