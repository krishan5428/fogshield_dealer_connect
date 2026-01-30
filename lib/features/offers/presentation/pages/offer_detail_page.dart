import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_snackbar.dart';
import 'package:fogshield_dealer_connect/features/offers/presentation/state/offer_state.dart';

@RoutePage()
class OfferDetailPage extends StatelessWidget {
  final Offer? offer;

  const OfferDetailPage({super.key, this.offer});

  @override
  Widget build(BuildContext context) {
    if (offer == null) {
      return const Scaffold(body: Center(child: Text('Offer details not found.')));
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: CustomAppBar(title: offer!.title),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(32),
              color: AppColors.colorCompanyPrimary,
              child: Column(
                children: [
                  const Icon(Icons.stars_rounded, color: Colors.white, size: 64),
                  const SizedBox(height: 16),
                  Text(
                    '${offer!.discount} FLAT DISCOUNT',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    offer!.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Terms & Conditions',
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  ...offer!.terms.map((term) => _buildTerm(term)),
                  const SizedBox(height: 40),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.grey.withOpacity(0.3)),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          'YOUR UNIQUE CODE',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            color: AppColors.disabledGrey,
                            letterSpacing: 1.0,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          offer!.code,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: AppColors.colorCompanyPrimary,
                            letterSpacing: 2.0,
                          ),
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'COPY TO CLIPBOARD',
                          size: ButtonSize.small,
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: offer!.code));
                            CustomSnackbar.showSuccess(
                              context: context,
                              title: 'Coupon Copied',
                              message: 'The code ${offer!.code} is ready for use.',
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTerm(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check_circle_outline_rounded, size: 18, color: AppColors.connectionGreen),
          const SizedBox(width: 12),
          Expanded(child: Text(text, style: const TextStyle(height: 1.4))),
        ],
      ),
    );
  }
}