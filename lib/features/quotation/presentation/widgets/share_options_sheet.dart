import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_bottom_sheet.dart';
import 'package:fogshield_dealer_connect/core/widgets/share_button.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/whatsapp_share_preview.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/email_share_preview.dart';
import 'package:fogshield_dealer_connect/core/utils/share_helper.dart';

class ShareOptionsSheet extends StatelessWidget {
  const ShareOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      title: 'Share Quotation',
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        children: [
          ShareButton(
            label: 'WhatsApp',
            icon: Icons.chat_rounded,
            color: AppColors.connectionGreen,
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => const WhatsAppSharePreview(
                  quotationId: 'QT-2026-0082',
                  customerName: 'John Wick',
                ),
              );
            },
          ),
          ShareButton(
            label: 'Email',
            icon: Icons.email_rounded,
            color: AppColors.azure,
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context,
                builder: (context) => const EmailSharePreview(),
              );
            },
          ),
          ShareButton(
            label: 'Download',
            icon: Icons.download_for_offline_rounded,
            color: AppColors.colorCompanyPrimary,
            onTap: () {
              Navigator.pop(context);
              ShareHelper.saveToDownloads(context);
            },
          ),
        ],
      ),
    );
  }
}