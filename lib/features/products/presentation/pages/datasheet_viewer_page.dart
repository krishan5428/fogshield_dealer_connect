import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class DatasheetViewerPage extends StatefulWidget {
  final String? pdfUrl;

  const DatasheetViewerPage({super.key, this.pdfUrl});

  @override
  State<DatasheetViewerPage> createState() => _DatasheetViewerPageState();
}

class _DatasheetViewerPageState extends State<DatasheetViewerPage> {
  String? localPath;
  bool isLoading = true;
  String? errorMessage;
  int currentPage = 0;
  int totalPages = 0;
  PDFViewController? pdfController;

  @override
  void initState() {
    super.initState();
    if (widget.pdfUrl != null) {
      _downloadAndLoadPdf();
    } else {
      setState(() {
        isLoading = false;
        errorMessage = 'No PDF URL provided';
      });
    }
  }

  Future<void> _downloadAndLoadPdf() async {
    try {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      // Download PDF from Google Drive
      final response = await http.get(Uri.parse(widget.pdfUrl!));

      if (response.statusCode == 200) {
        // Get temporary directory
        final dir = await getTemporaryDirectory();
        final file = File('${dir.path}/temp_datasheet_${DateTime.now().millisecondsSinceEpoch}.pdf');

        // Write PDF to file
        await file.writeAsBytes(response.bodyBytes);

        setState(() {
          localPath = file.path;
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
          errorMessage = 'Failed to download PDF. Status: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Error loading PDF: $e';
      });
    }
  }

  Future<void> _sharePdf() async {
    if (widget.pdfUrl != null) {
      final uri = Uri.parse(widget.pdfUrl!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  Future<void> _printPdf() async {
    // Show message for print functionality
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Print functionality coming soon'),
          backgroundColor: AppColors.colorCompanyPrimary,
        ),
      );
    }
  }

  void _zoomIn() {
    if (pdfController != null) {
      pdfController!.setPage(currentPage);
    }
  }

  void _zoomOut() {
    if (pdfController != null) {
      pdfController!.setPage(currentPage);
    }
  }

  void _resetZoom() {
    if (pdfController != null) {
      pdfController!.setPage(currentPage);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Document Viewer',
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: _sharePdf,
          ),
          IconButton(
            icon: const Icon(Icons.print_rounded),
            onPressed: _printPdf,
          ),
        ],
      ),
      body: Stack(
        children: [
          if (isLoading)
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Loading PDF...',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.disabledGrey,
                    ),
                  ),
                ],
              ),
            )
          else if (errorMessage != null)
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.error_outline,
                      size: 64,
                      color: AppColors.disabledGrey,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      errorMessage!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: AppColors.disabledGrey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: _downloadAndLoadPdf,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Retry'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.colorCompanyPrimary,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          else if (localPath != null)
              Column(
                children: [
                  // Page indicator
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    color: AppColors.grey.withOpacity(0.1),
                    child: Center(
                      child: Text(
                        'Page ${currentPage + 1} of $totalPages',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  // PDF Viewer
                  Expanded(
                    child: PDFView(
                      filePath: localPath!,
                      enableSwipe: true,
                      swipeHorizontal: false,
                      autoSpacing: true,
                      pageFling: true,
                      pageSnap: true,
                      defaultPage: currentPage,
                      fitPolicy: FitPolicy.WIDTH,
                      onRender: (pages) {
                        setState(() {
                          totalPages = pages ?? 0;
                        });
                      },
                      onViewCreated: (PDFViewController controller) {
                        pdfController = controller;
                      },
                      onPageChanged: (page, total) {
                        setState(() {
                          currentPage = page ?? 0;
                          totalPages = total ?? 0;
                        });
                      },
                      onError: (error) {
                        setState(() {
                          errorMessage = error.toString();
                        });
                      },
                    ),
                  ),
                ],
              ),
          // Zoom controls
          if (!isLoading && errorMessage == null && localPath != null)
            Positioned(
              right: 16,
              bottom: 32,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // _buildFab(Icons.add, _zoomIn),
                  // const SizedBox(height: 12),
                  // _buildFab(Icons.remove, _zoomOut),
                  // const SizedBox(height: 12),
                  _buildFab(Icons.fullscreen_exit_rounded, _resetZoom),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFab(IconData icon, VoidCallback onTap) {
    return FloatingActionButton.small(
      heroTag: icon.toString(),
      onPressed: onTap,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.colorCompanyPrimary,
      elevation: 4,
      child: Icon(icon),
    );
  }

  @override
  void dispose() {
    // Clean up temporary file
    if (localPath != null) {
      try {
        File(localPath!).delete();
      } catch (e) {
        // Ignore errors during cleanup
      }
    }
    super.dispose();
  }
}