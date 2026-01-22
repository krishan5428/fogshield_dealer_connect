import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_bottom_sheet.dart';

class FileInfoSheet extends StatelessWidget {
  final String title;
  final String size;
  final String type;

  const FileInfoSheet({
    super.key,
    required this.title,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Resource Details',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildRow('File Name', title),
            _buildRow('File Size', size),
            _buildRow('Format', type),
            _buildRow('Category', 'Technical Documentation'),
            const SizedBox(height: 32),
            CustomButton(
              text: 'OPEN DOCUMENT',
              icon: Icons.open_in_new_rounded,
              onPressed: () => Navigator.pop(context),
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'DOWNLOAD FOR OFFLINE',
              isOutlined: true,
              icon: Icons.download_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: AppColors.disabledGrey, fontWeight: FontWeight.w600, fontSize: 13)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 13)),
        ],
      ),
    );
  }
}