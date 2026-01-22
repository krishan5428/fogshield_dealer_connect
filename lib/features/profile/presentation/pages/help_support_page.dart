import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/faq_item.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/contact_option_card.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Help & Support'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const ContactOptionCard(
              title: 'Call Support',
              subtitle: '+91 1800-123-456',
              icon: Icons.call_outlined,
              color: AppColors.azure,
            ),
            const ContactOptionCard(
              title: 'Email Us',
              subtitle: 'support@fogshield.com',
              icon: Icons.email_outlined,
              color: AppColors.mutedRed,
            ),
            const ContactOptionCard(
              title: 'WhatsApp',
              subtitle: 'Chat with us online',
              icon: Icons.chat_outlined,
              color: AppColors.connectionGreen,
            ),
            const SizedBox(height: 32),
            Text(
              'Frequently Asked Questions',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            const FAQItem(
              question: 'How to create a new quotation?',
              answer: 'You can create a new quotation by tapping the "Create Quotation" button on the dashboard and following the 4-step process.',
            ),
            const FAQItem(
              question: 'Where can I find product datasheets?',
              answer: 'All product documentation is available under the "Resources" section on your dashboard.',
            ),
            const FAQItem(
              question: 'How to share a quotation via WhatsApp?',
              answer: 'After generating a quotation, select "Share PDF" and choose WhatsApp from the sharing options.',
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  const Text(
                    'App Version 1.0.0 (Build 26)',
                    style: TextStyle(color: AppColors.disabledGrey, fontSize: 12),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Check for Updates'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}