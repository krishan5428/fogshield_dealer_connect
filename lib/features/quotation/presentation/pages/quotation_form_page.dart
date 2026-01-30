import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_form_fields.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/form_actions.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';

class QuotationFormPage extends ConsumerStatefulWidget {
  const QuotationFormPage({super.key});

  @override
  ConsumerState<QuotationFormPage> createState() => _QuotationFormPageState();
}

class _QuotationFormPageState extends ConsumerState<QuotationFormPage> {
  final _formKey = GlobalKey<FormState>();

  void _onNext() {
    if (_formKey.currentState!.validate()) {
      // Data is now auto-saved as the user types,
      // so we just need to validate and navigate.
      context.push(RouteNames.productSelection);
    }
  }

  void _onSaveDraft() {
    // Show feedback that the progress is saved
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Progress saved automatically'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        // REQUIREMENT: When back press happens, don't save as draft, delete/reset instead.
        // This ensures that if a user abandons the form, no partial data remains
        // in the session providers (Quotation Form and Cart).
        ref.read(quotationFormProvider.notifier).resetForm();
        ref.read(cartProvider.notifier).clearCart();
      },
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Customer Details'),
        body: Column(
          children: [
            const StepperIndicator(currentStep: 1),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    // Form fields now handle their own state updates in real-time
                    QuotationFormFields(
                      formKey: _formKey,
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: FormActions(
          onNext: _onNext,
          onSaveDraft: _onSaveDraft,
        ),
      ),
    );
  }
}