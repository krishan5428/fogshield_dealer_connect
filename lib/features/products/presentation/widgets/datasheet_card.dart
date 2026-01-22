import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/download_indicator.dart';

class DatasheetCard extends StatelessWidget {
  final String title;
  final String sku;
  final String fileSize;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  const DatasheetCard({
    super.key,
    required this.title,
    required this.sku,
    required this.fileSize,
    required this.onTap,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey.withOpacity(0.2)),
      ),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.redBg.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(Icons.picture_as_pdf_rounded, color: AppColors.colorCompanyPrimary),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14),
        ),
        subtitle: Text(
          '$sku • $fileSize',
          style: const TextStyle(fontSize: 11, color: AppColors.disabledGrey, fontWeight: FontWeight.w500),
        ),
        trailing: DownloadIndicator(
          isDownloaded: false,
          onDownload: onDownload,
        ),
      ),
    );
  }
}