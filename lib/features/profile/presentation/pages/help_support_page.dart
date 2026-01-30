import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/faq_item.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/widgets/contact_option_card.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';

@RoutePage()
class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  Future<void> _launchURL(BuildContext context, String urlString, String errorMessage) async {
    try {
      final Uri url = Uri.parse(urlString);
      final bool canLaunch = await canLaunchUrl(url);

      if (canLaunch) {
        final bool launched = await launchUrl(
          url,
          mode: LaunchMode.externalApplication,
        );

        if (!launched && context.mounted) {
          CustomSnackbar.showError(
            context: context,
            title: 'Launch Failed',
            message: errorMessage,
          );
        }
      } else {
        if (context.mounted) {
          CustomSnackbar.showError(
            context: context,
            title: 'Not Available',
            message: errorMessage,
          );
        }
      }
    } catch (e) {
      debugPrint('Error launching URL: $e');
      if (context.mounted) {
        CustomSnackbar.showError(
          context: context,
          title: 'Error',
          message: 'Failed to open: ${e.toString()}',
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const CustomAppBar(title: 'Help & Support'),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 16),
              child: Text(
                'DIRECT CONTACT',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: AppColors.colorAccent,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            ContactOptionCard(
              title: 'Call Support',
              subtitle: '+91-129-4270000',
              icon: Icons.call_rounded,
              onTap: () async {
                await _launchURL(
                  context,
                  'tel:+911294270000',
                  'Could not open dialer. Please dial +91-129-4270000 manually.',
                );
              },
            ),
            ContactOptionCard(
              title: 'Email Us',
              subtitle: 'support@securicoelectronics.com',
              icon: Icons.email_rounded,
              onTap: () async {
                await _launchURL(
                  context,
                  'mailto:support@securicoelectronics.com?subject=Support%20Request%20-%20Dealer%20App',
                  'No email app found. Please email support@securicoelectronics.com.',
                );
              },
            ),
            ContactOptionCard(
              title: 'WhatsApp Chat',
              subtitle: '+91 8178-370-666',
              icon: Icons.chat_rounded,
              gradientColors: const [
                Color(0xFF22C55E),
                Color(0xFF16A34A),
              ],
              onTap: () async {
                await _launchURL(
                  context,
                  'https://wa.me/918178370666',
                  'WhatsApp is not installed. Please install WhatsApp or contact via phone/email.',
                );
              },
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.only(left: 4, bottom: 16),
              child: Text(
                'COMMON QUERIES',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w900,
                  color: AppColors.colorAccent,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            const FAQItem(
              question: 'How to create a new quotation?',
              answer: 'Go to the Dashboard and tap "New Quotation". Follow the 4-step process to enter customer details, select Fogshield units, review the cart, and generate your PDF.',
            ),
            const FAQItem(
              question: 'Where are the technical datasheets?',
              answer: 'All technical documentation, including manuals and datasheets, can be found in the "Resources" section under "Datasheets" in the sidebar or dashboard.',
            ),
            const FAQItem(
              question: 'Can I track if a customer opened a quote?',
              answer: 'Yes! In the "Activity Logs" (Quotation History) section, you can see the real-time status of each quotation, including "Sent" and "Viewed by Customer".',
            ),
            const SizedBox(height: 40),
            Center(
              child: Column(
                children: [
                  const Text(
                    'APP VERSION 1.0.0 (STABLE)',
                    style: TextStyle(
                      color: AppColors.disabledGrey,
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.0,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'CHECK FOR UPDATES',
                      style: TextStyle(fontSize: 11, fontWeight: FontWeight.w800),
                    ),
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