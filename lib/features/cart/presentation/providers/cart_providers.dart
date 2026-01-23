import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/cart/presentation/state/cart_state.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(CartState(items: []));

  void updateQuantity(String productId, String name, double price, int quantity) {
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
          if (item.id == productId) return item.copyWith(quantity: quantity);
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
          ),
        ],
      );
    }
  }

  int getQuantity(String productId) {
    final item = state.items.cast<CartItem?>().firstWhere(
          (item) => item?.id == productId,
      orElse: () => null,
    );
    return item?.quantity ?? 0;
  }

  void clearCart() {
    state = CartState(items: []);
  }
}