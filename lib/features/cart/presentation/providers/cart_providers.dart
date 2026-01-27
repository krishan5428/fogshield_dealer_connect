import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/state/cart_state.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState(items: []));

  /// New method for Catalog/Grid: Uses the Product object directly
  void updateProductQuantity({
    required Product product,
    required int quantity,
  }) {
    updateQuantity(
      productId: product.model,
      name: product.name,
      price: product.endUserPrice,
      quantity: quantity,
      imageUrl: product.imagePath,
    );
  }

  /// Original method for Cart Page: Uses specific IDs and details
  /// This fixes the error: 'updateQuantity' isn't defined for the type 'CartNotifier'
  void updateQuantity({
    required String productId,
    required String name,
    required double price,
    required int quantity,
    String? imageUrl,
  }) {
    final existingIndex = state.items.indexWhere((item) => item.id == productId);

    if (quantity <= 0) {
      if (existingIndex != -1) {
        state = state.copyWith(
          items: state.items.where((item) => item.id != productId).toList(),
        );
      }
      return;
    }

    if (existingIndex != -1) {
      state = state.copyWith(
        items: state.items.map((item) {
          if (item.id == productId) {
            return item.copyWith(quantity: quantity);
          }
          return item;
        }).toList(),
      );
    } else {
      state = state.copyWith(
        items: [
          ...state.items,
          CartItem(
            id: productId,
            name: name,
            sku: productId,
            price: price,
            quantity: quantity,
            imageUrl: imageUrl,
          ),
        ],
      );
    }
  }

  void applyDiscount(double percentage) {
    state = state.copyWith(discountPercentage: percentage);
  }

  int getQuantity(String productId) {
    final item = state.items.firstWhere(
          (item) => item.id == productId,
      orElse: () => CartItem(id: '', name: '', sku: '', price: 0, quantity: 0),
    );
    return item.quantity;
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
}