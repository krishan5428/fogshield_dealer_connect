import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class SwipeActionButtons extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onShare;

  const SwipeActionButtons({
    super.key,
    required this.onDelete,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: onShare,
          icon: const Icon(Icons.share_rounded, color: Colors.blue, size: 20),
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline_rounded, color: AppColors.mutedRed, size: 20),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}