import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class DownloadProgressDialog extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const DownloadProgressDialog({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.file_download_outlined, size: 48, color: AppColors.colorCompanyPrimary),
            const SizedBox(height: 20),
            const Text(
              'Saving Quotation...',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 20),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: AppColors.lightGrey,
              color: AppColors.colorCompanyPrimary,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 12),
            Text(
              '${(progress * 100).toInt()}%',
              style: const TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}