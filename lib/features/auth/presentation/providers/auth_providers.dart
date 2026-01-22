import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState.initial());

  Future<void> login(String phone, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    // Simulating API call with a slight delay for realism
    await Future.delayed(const Duration(seconds: 2));

    // Dummy credentials as requested
    if (phone == "7562095494" && password == "123456") {
      state = state.copyWith(status: AuthStatus.authenticated);
    } else {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Invalid credentials.",
      );
    }
  }

  Future<void> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);

    // Simulating registration API call
    await Future.delayed(const Duration(seconds: 2));

    // In this dummy version, any signup leads to authentication
    state = state.copyWith(status: AuthStatus.authenticated);
  }

  void logout() {
    state = AuthState.initial();
  }
}