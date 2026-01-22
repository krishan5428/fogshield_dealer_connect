import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class DownloadIndicator extends StatelessWidget {
  final bool isDownloaded;
  final VoidCallback onDownload;

  const DownloadIndicator({
    super.key,
    required this.isDownloaded,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: isDownloaded ? null : onDownload,
      icon: isDownloaded
          ? const Icon(Icons.check_circle_rounded, color: AppColors.green, size: 22)
          : const Icon(Icons.file_download_outlined, color: AppColors.colorCompanyPrimary, size: 22),
    );
  }
}