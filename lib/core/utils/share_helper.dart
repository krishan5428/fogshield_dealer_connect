import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';

class ShareHelper {
  ShareHelper._();

  static Future<void> shareToWhatsApp({
    required BuildContext context,
    required String phone,
    required String message,
  }) async {
    // Logic for launching WhatsApp via deep link
    // Example: whatsapp://send?phone=$phone&text=$message
    CustomSnackbar.showInfo(
      context: context,
      title: 'WhatsApp',
      message: 'Opening WhatsApp to share quotation...',
    );
  }

  static Future<void> shareToEmail({
    required BuildContext context,
    required String email,
    required String subject,
    required String body,
  }) async {
    // Logic for launching default mail app
    CustomSnackbar.showInfo(
      context: context,
      title: 'Email',
      message: 'Opening Email client...',
    );
  }

  static Future<void> saveToDownloads(BuildContext context) async {
    // Logic for saving PDF bytes to device storage
    CustomSnackbar.showSuccess(
      context: context,
      title: 'Saved',
      message: 'Quotation PDF saved to Downloads folder.',
    );
  }

  static String generateWhatsAppTemplate(String customerName, String quotationId) {
    return "Hello $customerName,\n\nGreetings from fogshield! Please find attached your quotation ($quotationId). Let us know if you have any questions.\n\nRegards,\nDealer Team";
  }
}