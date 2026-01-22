class Offer {
  final String id;
  final String title;
  final String description;
  final String discount;
  final String code;
  final DateTime expiryDate;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.code,
    required this.expiryDate,
  });
}

class OfferState {
  final List<Offer> offers;
  final bool isLoading;

  OfferState({required this.offers, this.isLoading = false});
}