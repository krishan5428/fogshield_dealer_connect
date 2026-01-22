import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';

class CustomSnackbar {
  CustomSnackbar._();

  static void showSuccess({
    required BuildContext context,
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 4),
      primaryColor: AppColors.connectionGreen,
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
    );
  }

  static void showError({
    required BuildContext context,
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      alignment: Alignment.bottomCenter,
      autoCloseDuration: const Duration(seconds: 5),
      primaryColor: AppColors.mutedRed,
      borderRadius: BorderRadius.circular(12),
      showProgressBar: true,
    );
  }

  static void showInfo({
    required BuildContext context,
    required String title,
    String? message,
  }) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(title),
      description: message != null ? Text(message) : null,
      alignment: Alignment.bottomRight,
      autoCloseDuration: const Duration(seconds: 4),
      primaryColor: AppColors.colorCompanyPrimary,
      borderRadius: BorderRadius.circular(12),
      showProgressBar: false,
    );
  }
}