import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class CartItemActions extends StatelessWidget {
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const CartItemActions({
    super.key,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onEdit,
          icon: const Icon(Icons.edit_note_rounded, color: AppColors.colorAccent),
          tooltip: 'Notes',
        ),
        const Spacer(),
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete_outline_rounded, color: AppColors.mutedRed),
          tooltip: 'Remove',
        ),
      ],
    );
  }
}