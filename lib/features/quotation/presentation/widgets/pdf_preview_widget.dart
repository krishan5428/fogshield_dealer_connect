import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';

class PdfPreviewWidget extends StatelessWidget {
  const PdfPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: In a real app, you would use PdfPreview from the 'printing' package.
    // This is a UI-first representation.
    return Container(
      color: AppColors.lightGrey.withOpacity(0.5),
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5)),
            ],
          ),
          child: Column(
            children: [
              // Mock PDF Content
              Container(
                height: 80,
                color: AppColors.colorCompanyPrimary,
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.shield_rounded, color: Colors.white, size: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('QUOTATION', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        Text('QT-2026-0082', style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 10)),
                      ],
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Center(
                  child: Opacity(
                    opacity: 0.1,
                    child: Icon(Icons.picture_as_pdf_rounded, size: 120),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}