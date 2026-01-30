import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_dialog.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  final String itemName;
  final VoidCallback onConfirm;

  const DeleteConfirmationDialog({
    super.key,
    required this.itemName,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Remove Item?',
      message: 'Are you sure you want to remove "$itemName" from the quotation?',
      confirmText: 'REMOVE',
      cancelText: 'CANCEL',
      type: DialogType.error,
      onConfirm: () {
        onConfirm();
        Navigator.pop(context);
      },
    );
  }
}