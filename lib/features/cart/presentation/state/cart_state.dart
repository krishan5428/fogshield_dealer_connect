class CartItem {
  final String id;
  final String name;
  final String sku;
  final double price;
  final int quantity;
  final String? imageUrl;

  CartItem({
    required this.id,
    required this.name,
    required this.sku,
    required this.price,
    required this.quantity,
    this.imageUrl,
  });

  double get total => price * quantity;

  CartItem copyWith({int? quantity}) {
    return CartItem(
      id: id,
      name: name,
      sku: sku,
      price: price,
      quantity: quantity ?? this.quantity,
      imageUrl: imageUrl,
    );
  }
}

class CartState {
  final List<CartItem> items;
  final double discountAmount;
  final bool isLoading;

  CartState({
    required this.items,
    this.discountAmount = 0,
    this.isLoading = false,
  });

  double get subtotal => items.fold(0, (sum, item) => sum + item.total);
  double get tax => (subtotal - discountAmount) * 0.18; // 18% GST
  double get total => (subtotal - discountAmount) + tax;

  CartState copyWith({
    List<CartItem>? items,
    double? discountAmount,
    bool? isLoading,
  }) {
    return CartState(
      items: items ?? this.items,
      discountAmount: discountAmount ?? this.discountAmount,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}