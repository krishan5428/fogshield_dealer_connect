import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_summary.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/status_timeline.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_status_badge.dart';

class QuotationDetailPage extends StatelessWidget {
  const QuotationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(
        title: 'Quotation Details',
        actions: [
          IconButton(
            icon: const Icon(Icons.share_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.grey.withOpacity(0.2)),
              ),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CURRENT STATUS',
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, color: AppColors.disabledGrey),
                      ),
                      QuotationStatusBadge(status: QuotationStatus.sent),
                    ],
                  ),
                  SizedBox(height: 24),
                  StatusTimeline(),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'DOCUMENT OVERVIEW',
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w900, letterSpacing: 1.0, color: AppColors.colorAccent),
            ),
            const SizedBox(height: 12),
            const QuotationSummary(),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Row(
          children: [
            Expanded(
              child: CustomButton(
                text: 'EDIT QUOTE',
                isOutlined: true,
                icon: Icons.edit_note_rounded,
                onPressed: () {},
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                text: 'VIEW PDF',
                icon: Icons.picture_as_pdf_rounded,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}