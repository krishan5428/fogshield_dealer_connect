import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_summary.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_success_dialog.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';

class QuotationReviewPage extends ConsumerStatefulWidget {
  const QuotationReviewPage({super.key});

  @override
  ConsumerState<QuotationReviewPage> createState() => _QuotationReviewPageState();
}

class _QuotationReviewPageState extends ConsumerState<QuotationReviewPage> {
  bool _isSubmitting = false;

  void _handleSubmit() async {
    setState(() => _isSubmitting = true);

    // Simulate API submission process
    await Future.delayed(const Duration(milliseconds: 2500));

    if (!mounted) return;
    setState(() => _isSubmitting = false);

    // Clear cart and form after successful submission if needed
    // ref.read(cartProvider.notifier).clearCart();
    // ref.read(quotationFormProvider.notifier).resetForm();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const QuotationSuccessDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Watch providers to ensure UI updates if state changes elsewhere
    final cartState = ref.watch(cartProvider);
    final formState = ref.watch(quotationFormProvider);

    return Stack(
      children: [
        Scaffold(
          backgroundColor: const Color(0xFFF8F9FA),
          appBar: const CustomAppBar(title: 'Verify & Submit'),
          body: Column(
            children: [
              const StepperIndicator(currentStep: 4),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      // The summary now reflects real-time form and cart data
                      const QuotationSummary(),
                      const SizedBox(height: 32),
                      const Icon(Icons.verified_user_outlined, color: AppColors.disabledGrey, size: 24),
                      const SizedBox(height: 12),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          'Please ensure all values and terms are correct. Submitted quotations are final and will generate a legal document for the customer.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            color: AppColors.disabledGrey,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'SAVE DRAFT',
                    isOutlined: true,
                    onPressed: _isSubmitting ? null : () {
                      // Draft logic using formState and cartState
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'SUBMIT QUOTE',
                    // Disable if cart is empty
                    onPressed: (_isSubmitting || cartState.items.isEmpty) ? null : _handleSubmit,
                  ),
                ),
              ],
            ),
          ),
        ),

        if (_isSubmitting)
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                color: Colors.black.withOpacity(0.3),
                child: Center(
                  child: Card(
                    elevation: 12,
                    shadowColor: Colors.black45,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const LoadingIndicator(size: 48, strokeWidth: 4),
                          const SizedBox(height: 32),
                          Text(
                            'Finalizing Quotation...',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppColors.colorCompanyPrimary,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Generating your document securely',
                            style: TextStyle(
                              color: AppColors.disabledGrey,
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}