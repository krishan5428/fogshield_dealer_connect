import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/quotation/presentation/state/quotation_form_state.dart';

final quotationFormProvider = StateNotifierProvider<QuotationFormNotifier, QuotationFormState>((ref) {
  return QuotationFormNotifier();
});

class QuotationFormNotifier extends StateNotifier<QuotationFormState> {
  QuotationFormNotifier() : super(QuotationFormState());

  void updateField({
    String? name,
    String? phone,
    String? email,
    String? gst,
    String? company,
    String? bAddress,
    String? bCity,
    String? bState,
    String? bPincode,
    bool? sameAsBilling,
    String? sAddress,
    String? sCity,
    String? sState,
    String? sPincode,
    String? notes,
  }) {
    state = state.copyWith(
      customerName: name ?? state.customerName,
      phoneNumber: phone ?? state.phoneNumber,
      email: email ?? state.email,
      gstNumber: gst ?? state.gstNumber,
      companyName: company ?? state.companyName,
      billingAddress: bAddress ?? state.billingAddress,
      billingCity: bCity ?? state.billingCity,
      billingState: bState ?? state.billingState,
      billingPincode: bPincode ?? state.billingPincode,
      sameAsBilling: sameAsBilling ?? state.sameAsBilling,
      shippingAddress: sAddress ?? state.shippingAddress,
      shippingCity: sCity ?? state.shippingCity,
      shippingState: sState ?? state.shippingState,
      shippingPincode: sPincode ?? state.shippingPincode,
      notes: notes ?? state.notes,
    );
  }

  void resetForm() {
    state = QuotationFormState();
  }
}