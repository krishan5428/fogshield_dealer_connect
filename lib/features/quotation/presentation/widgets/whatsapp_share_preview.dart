import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/utils/share_helper.dart';

class WhatsAppSharePreview extends StatefulWidget {
  final String quotationId;
  final String customerName;

  const WhatsAppSharePreview({
    super.key,
    required this.quotationId,
    required this.customerName,
  });

  @override
  State<WhatsAppSharePreview> createState() => _WhatsAppSharePreviewState();
}

class _WhatsAppSharePreviewState extends State<WhatsAppSharePreview> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(
      text: ShareHelper.generateWhatsAppTemplate(widget.customerName, widget.quotationId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('WhatsApp Message', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightGrey.withOpacity(0.3),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'SEND ON WHATSAPP',
              icon: Icons.send_rounded,
              onPressed: () {
                Navigator.pop(context);
                ShareHelper.shareToWhatsApp(
                  context: context,
                  phone: '9899446573', // Mock phone
                  message: _controller.text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}