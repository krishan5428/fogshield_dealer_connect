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
      customerName: name,
      phoneNumber: phone,
      email: email,
      gstNumber: gst,
      companyName: company,
      billingAddress: bAddress,
      billingCity: bCity,
      billingState: bState,
      billingPincode: bPincode,
      sameAsBilling: sameAsBilling,
      shippingAddress: sAddress,
      shippingCity: sCity,
      shippingState: sState,
      shippingPincode: sPincode,
      notes: notes,
    );
  }

  void resetForm() {
    state = QuotationFormState();
  }
}