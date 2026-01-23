class Offer {
  final String id;
  final String title;
  final String description;
  final String discount;
  final String code;
  final DateTime expiryDate;
  final List<String> terms;
  final String bannerTitle;

  Offer({
    required this.id,
    required this.title,
    required this.description,
    required this.discount,
    required this.code,
    required this.expiryDate,
    required this.terms,
    this.bannerTitle = 'EXCLUSIVE DEALER OFFER',
  });
}