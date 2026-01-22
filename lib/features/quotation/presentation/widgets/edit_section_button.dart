import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class EditSectionButton extends StatelessWidget {
  final VoidCallback onTap;

  const EditSectionButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      visualDensity: VisualDensity.compact,
      icon: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.lightGrey,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Icon(Icons.edit_rounded, size: 14, color: AppColors.colorAccent),
      ),
      tooltip: 'Edit Section',
    );
  }
}