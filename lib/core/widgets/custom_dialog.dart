import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';

enum DialogType { info, success, warning, error }

class CustomDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String? cancelText;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final DialogType type;

  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Confirm',
    this.cancelText,
    this.onCancel,
    this.type = DialogType.info,
  });

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    Color iconColor;

    switch (type) {
      case DialogType.success:
        iconData = Icons.check_circle_outline_rounded;
        iconColor = AppColors.connectionGreen;
        break;
      case DialogType.warning:
        iconData = Icons.warning_amber_rounded;
        iconColor = AppColors.goldAccent;
        break;
      case DialogType.error:
        iconData = Icons.error_outline_rounded;
        iconColor = AppColors.mutedRed;
        break;
      case DialogType.info:
      iconData = Icons.info_outline_rounded;
        iconColor = AppColors.colorCompanyPrimary;
    }

    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(iconData, size: 64, color: iconColor),
          const SizedBox(height: 16),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.disabledGrey),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              if (cancelText != null)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomButton(
                      text: cancelText!,
                      isOutlined: true,
                      onPressed: onCancel ?? () => Navigator.pop(context),
                      size: ButtonSize.medium,
                    ),
                  ),
                ),
              Expanded(
                child: CustomButton(
                  text: confirmText,
                  backgroundColor: type == DialogType.error ? AppColors.mutedRed : null,
                  onPressed: onConfirm,
                  size: ButtonSize.medium,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Helper function to show dialog
Future<T?> showAppDialog<T>(BuildContext context, CustomDialog dialog) {
  return showDialog<T>(
    context: context,
    builder: (context) => dialog,
  );
}