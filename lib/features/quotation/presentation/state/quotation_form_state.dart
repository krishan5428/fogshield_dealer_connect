class QuotationFormState {
  final String customerName;
  final String phoneNumber;
  final String email;
  final String companyName;
  final String billingAddress;
  final String billingCity;
  final String billingState;
  final String billingPincode;
  final bool sameAsBilling;
  final String shippingAddress;
  final String shippingCity;
  final String shippingState;
  final String shippingPincode;
  final String notes;

  QuotationFormState({
    this.customerName = '',
    this.phoneNumber = '',
    this.email = '',
    this.companyName = '',
    this.billingAddress = '',
    this.billingCity = '',
    this.billingState = '',
    this.billingPincode = '',
    this.sameAsBilling = true,
    this.shippingAddress = '',
    this.shippingCity = '',
    this.shippingState = '',
    this.shippingPincode = '',
    this.notes = '',
  });

  QuotationFormState copyWith({
    String? customerName,
    String? phoneNumber,
    String? email,
    String? companyName,
    String? billingAddress,
    String? billingCity,
    String? billingState,
    String? billingPincode,
    bool? sameAsBilling,
    String? shippingAddress,
    String? shippingCity,
    String? shippingState,
    String? shippingPincode,
    String? notes,
  }) {
    return QuotationFormState(
      customerName: customerName ?? this.customerName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      companyName: companyName ?? this.companyName,
      billingAddress: billingAddress ?? this.billingAddress,
      billingCity: billingCity ?? this.billingCity,
      billingState: billingState ?? this.billingState,
      billingPincode: billingPincode ?? this.billingPincode,
      sameAsBilling: sameAsBilling ?? this.sameAsBilling,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      shippingCity: shippingCity ?? this.shippingCity,
      shippingState: shippingState ?? this.shippingState,
      shippingPincode: shippingPincode ?? this.shippingPincode,
      notes: notes ?? this.notes,
    );
  }
}