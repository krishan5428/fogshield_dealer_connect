import 'package:flutter/material.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_form_fields.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/form_actions.dart';
// import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/customer_search.dart';
import 'package:go_router/go_router.dart';
import 'package:fogshield_dealer_connect/app/routes/route_names.dart';

class QuotationFormPage extends StatefulWidget {
  const QuotationFormPage({super.key});

  @override
  State<QuotationFormPage> createState() => _QuotationFormPageState();
}

class _QuotationFormPageState extends State<QuotationFormPage> {
  final _formKey = GlobalKey<FormState>();

  void _onNext() {
    if (_formKey.currentState!.validate()) {
      // Logic to save state can be added here later
      context.push(RouteNames.productSelection);
    }
  }

  void _onSaveDraft() {
    // Logic for saving draft
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Quotation saved as draft')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // const CustomerSearch(),
                  const SizedBox(height: 8),
                  QuotationFormFields(formKey: _formKey),
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
    );
  }
}