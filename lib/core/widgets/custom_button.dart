import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final ButtonSize size;
  final IconData? icon;
  final bool isOutlined;
  final Color? backgroundColor;
  final Color? textColor;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.size = ButtonSize.medium,
    this.icon,
    this.isOutlined = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determine dimensions based on size
    double verticalPadding;
    double fontSize;
    double? minHeight;

    switch (size) {
      case ButtonSize.small:
        verticalPadding = 8;
        fontSize = 12;
        minHeight = 36;
        break;
      case ButtonSize.medium:
        verticalPadding = 12;
        fontSize = 14;
        minHeight = 48;
        break;
      case ButtonSize.large:
        verticalPadding = 16;
        fontSize = 16;
        minHeight = 56;
        break;
    }

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isLoading)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: LoadingIndicator(
              size: fontSize + 4,
              strokeWidth: 2,
              color: isOutlined ? AppColors.colorCompanyPrimary : AppColors.white,
            ),
          )
        else if (icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Icon(icon, size: fontSize + 4),
          ),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );

    final Color effectiveBgColor = backgroundColor ?? AppColors.colorCompanyPrimary;
    final Color effectiveTextColor = textColor ?? (isOutlined ? AppColors.colorCompanyPrimary : AppColors.white);

    Widget button;

    if (isOutlined) {
      button = OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: effectiveTextColor,
          disabledForegroundColor: effectiveTextColor, // Prevent gray text during loading
          side: BorderSide(color: effectiveBgColor, width: 1.5),
          padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 24),
          minimumSize: Size(0, minHeight),
        ),
        child: content,
      );
    } else {
      button = ElevatedButton(
        onPressed: isLoading ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: effectiveBgColor,
          foregroundColor: effectiveTextColor,
          disabledBackgroundColor: effectiveBgColor, // Prevent gray background during loading
          disabledForegroundColor: effectiveTextColor, // Prevent gray text during loading
          padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 24),
          minimumSize: Size(0, minHeight),
          elevation: 0,
        ),
        child: content,
      );
    }

    return isFullWidth ? SizedBox(width: double.infinity, child: button) : button;
  }
}