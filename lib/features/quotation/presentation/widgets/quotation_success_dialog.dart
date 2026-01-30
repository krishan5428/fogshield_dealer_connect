import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class QuotationSuccessDialog extends StatelessWidget {
  final String quotationId;

  const QuotationSuccessDialog({
    super.key,
    required this.quotationId,
  });

  @override
  Widget build(BuildContext context) {
    // REQUIREMENT: PopScope ensures any back interaction sends the user to the Dashboard
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        context.go(RouteNames.dashboard);
      },
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check_circle_rounded,
                  size: 90,
                  color: AppColors.green,
                ),
                const SizedBox(height: 24),
                const Text(
                  'Quotation Created!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.redBg.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'REFERENCE: $quotationId',
                    style: const TextStyle(
                      color: AppColors.colorCompanyPrimary,
                      fontWeight: FontWeight.w900,
                      fontSize: 12,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'The quotation has been generated successfully. A copy has been saved to your history. You can now preview and share it with your customer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.disabledGrey,
                    height: 1.5,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  text: 'PREVIEW DOCUMENT',
                  icon: Icons.picture_as_pdf_rounded,
                  onPressed: () {
                    // REQUIREMENT: Close dialog and ensure back-navigation from PDF goes to Dashboard
                    Navigator.pop(context); // Close dialog
                    context.go(RouteNames.dashboard); // Reset underlying stack to dashboard
                    context.push(RouteNames.quotationPdfViewer, extra: quotationId); // Push PDF on top
                  },
                ),
                const SizedBox(height: 12),
                CustomButton(
                  text: 'BACK TO DASHBOARD',
                  isOutlined: true,
                  onPressed: () => context.go(RouteNames.dashboard),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}