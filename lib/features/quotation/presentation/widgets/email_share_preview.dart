import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_text_field.dart';

class EmailSharePreview extends StatelessWidget {
  const EmailSharePreview({super.key});

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
            const Text('Email Quotation', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            const SizedBox(height: 20),
            const CustomTextField(label: 'To', hint: 'customer@email.com'),
            const SizedBox(height: 12),
            const CustomTextField(label: 'Subject', hint: 'Quotation from fogshield'),
            const SizedBox(height: 24),
            CustomButton(
              text: 'SEND EMAIL',
              icon: Icons.email_rounded,
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}