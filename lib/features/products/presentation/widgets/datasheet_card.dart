import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class DatasheetCard extends StatelessWidget {
  final String title;
  final String sku;
  final String fileSize;
  final VoidCallback onTap;
  final VoidCallback onDownload;
  final VoidCallback? onWatchVideo;
  final bool showOnlyVideo; // New flag to toggle "Only Video" mode

  const DatasheetCard({
    super.key,
    required this.title,
    required this.sku,
    required this.fileSize,
    required this.onTap,
    required this.onDownload,
    this.onWatchVideo,
    this.showOnlyVideo = false, // Defaults to false to keep original behavior
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icon changes based on whether it's a video or a document
                Icon(
                  showOnlyVideo ? Icons.play_circle_outline : Icons.description_outlined,
                  color: AppColors.colorCompanyPrimary,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        showOnlyVideo ? 'Product Video' : 'SKU: $sku • $fileSize',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            // Only show the Divider and PDF Row if we are NOT in "showOnlyVideo" mode
            if (!showOnlyVideo) ...[
              const Divider(height: 24),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      onPressed: onTap,
                      icon: const Icon(Icons.visibility_outlined, size: 18),
                      label: const Text('View PDF'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.colorCompanyPrimary,
                        side: const BorderSide(color: AppColors.colorCompanyPrimary),
                        padding: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: onDownload,
                    icon: const Icon(Icons.download_outlined),
                    color: AppColors.colorCompanyPrimary,
                  ),
                ],
              ),
            ],

            // Video button: Always shown if onWatchVideo is provided
            if (onWatchVideo != null) ...[
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: onWatchVideo,
                  icon: const Icon(Icons.play_circle_fill, size: 18),
                  label: const Text('Watch Product Video'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}