import 'dart:ui';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_app_bar.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/stepper_indicator.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_summary.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/widgets/quotation_success_dialog.dart';
import 'package:fogshield_dealer_connect/core/widgets/custom_button.dart';
import 'package:fogshield_dealer_connect/core/theme/app_colors.dart';
import 'package:fogshield_dealer_connect/core/widgets/loading_indicator.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/providers/cart_providers.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/providers/quotation_form_providers.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';
import 'package:fogshield_dealer_connect/core/providers/app_database_provider.dart';
import 'package:fogshield_dealer_connect/core/database/app_database_tables.dart' as tables;

@RoutePage()
class QuotationReviewPage extends ConsumerStatefulWidget {
  const QuotationReviewPage({super.key});

  @override
  ConsumerState<QuotationReviewPage> createState() => _QuotationReviewPageState();
}

class _QuotationReviewPageState extends ConsumerState<QuotationReviewPage> {
  bool _isSubmitting = false;

  ({Quotation quote, List<QuotationItem> items}) _getPreviewData() {
    final formState = ref.read(quotationFormProvider);
    final cartState = ref.read(cartProvider);

    final tempQuotation = Quotation(
      id: 'DRAFT-PREVIEW',
      customerName: formState.customerName,
      phoneNumber: formState.phoneNumber,
      email: formState.email,
      gstNumber: formState.gstNumber,
      companyName: formState.companyName,
      billingAddress: formState.billingAddress,
      billingCity: formState.billingCity,
      billingState: formState.billingState,
      billingPincode: formState.billingPincode,
      sameAsBilling: formState.sameAsBilling,
      shippingAddress: formState.shippingAddress,
      shippingCity: formState.shippingCity,
      shippingState: formState.shippingState,
      shippingPincode: formState.shippingPincode,
      totalAmount: cartState.total,
      discountPercentage: 0.0,
      status: tables.QuotationStatus.draft,
      syncStatus: tables.SyncStatus.localOnly,
      notes: formState.notes,
      createdAt: DateTime.now(),
    );

    final tempItems = cartState.items.map((item) {
      return QuotationItem(
        localId: 0,
        quotationId: 'DRAFT-PREVIEW',
        productModel: item.id,
        quantity: item.quantity,
        priceAtTimeOfSale: item.price,
      );
    }).toList();

    return (quote: tempQuotation, items: tempItems);
  }

  void _handleSubmit() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);

    final formState = ref.read(quotationFormProvider);
    final cartState = ref.read(cartProvider);
    final db = ref.read(databaseProvider);

    final quotationId = 'QT-${DateTime.now().year}-${const Uuid().v4().substring(0, 4).toUpperCase()}';

    try {
      final quotationRecord = Quotation(
        id: quotationId,
        customerName: formState.customerName,
        phoneNumber: formState.phoneNumber,
        email: formState.email,
        gstNumber: formState.gstNumber,
        companyName: formState.companyName,
        billingAddress: formState.billingAddress,
        billingCity: formState.billingCity,
        billingState: formState.billingState,
        billingPincode: formState.billingPincode,
        sameAsBilling: formState.sameAsBilling,
        shippingAddress: formState.shippingAddress,
        shippingCity: formState.shippingCity,
        shippingState: formState.shippingState,
        shippingPincode: formState.shippingPincode,
        totalAmount: cartState.total,
        discountPercentage: 0.0,
        status: tables.QuotationStatus.sent,
        syncStatus: tables.SyncStatus.localOnly,
        notes: formState.notes,
        createdAt: DateTime.now(),
      );

      final itemsToSave = cartState.items.map((item) {
        return QuotationItemsCompanion.insert(
          quotationId: quotationId,
          productModel: item.id,
          quantity: item.quantity,
          priceAtTimeOfSale: item.price,
        );
      }).toList();

      await db.saveFullQuotation(quotationRecord, itemsToSave);
      await Future.delayed(const Duration(seconds: 1));

      ref.read(cartProvider.notifier).clearCart();
      ref.read(quotationFormProvider.notifier).resetForm();

      if (!mounted) return;
      setState(() => _isSubmitting = false);

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => QuotationSuccessDialog(quotationId: quotationId),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving quotation: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cartState = ref.watch(cartProvider);
    final previewData = _getPreviewData();

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
                      QuotationSummary(
                        quotation: previewData.quote,
                        items: previewData.items,
                      ),
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
                BoxShadow(color: Colors.black.withOpacity(0.05), offset: const Offset(0, -4), blurRadius: 12),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    text: 'SAVE DRAFT',
                    isOutlined: true,
                    onPressed: _isSubmitting ? null : () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: CustomButton(
                    text: 'SUBMIT QUOTE',
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
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          LoadingIndicator(size: 48, strokeWidth: 4),
                          SizedBox(height: 32),
                          Text('Finalizing Quotation...', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                          SizedBox(height: 12),
                          Text('Generating your document securely', style: TextStyle(color: AppColors.disabledGrey, fontSize: 13)),
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