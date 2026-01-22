import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class QuotationSuccessDialog extends StatelessWidget {
  const QuotationSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        // Added SingleChildScrollView to prevent RenderFlex overflow on smaller screens
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
                child: const Text(
                  'REFERENCE: QT-2026-0082',
                  style: TextStyle(
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
                  Navigator.pop(context);
                  context.push(RouteNames.quotationPdfViewer);
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
    );
  }
}