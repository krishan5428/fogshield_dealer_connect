import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;

  final List<String> _validDealerCodes = [
    'SECDLR001',
    'SECDLR002',
    'SECDLR003',
    'SECDLR004',
    'SECDLR005',
  ];

  final Map<String, String> _userRegistry = {
    "7562095494": "123456",
  };

  AuthNotifier(this._ref) : super(AuthState.initial()) {
    _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    final loggedIn = await SecureStorageService.isLoggedIn();
    if (loggedIn) {
      final identifier = await SecureStorageService.getStoredPhone();
      state = state.copyWith(
        status: AuthStatus.authenticated,
        phoneNumber: identifier,
      );
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  Future<void> login(String identifier, String password) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);
    await Future.delayed(const Duration(seconds: 2));

    bool isRegisteredUser = _userRegistry.containsKey(identifier) && _userRegistry[identifier] == password;
    bool isValidDealerCode = _validDealerCodes.contains(identifier.toUpperCase()) && password == "123456";

    if (isRegisteredUser || isValidDealerCode) {
      await SecureStorageService.saveLoginSession(identifier);
      state = state.copyWith(
        status: AuthStatus.authenticated,
        phoneNumber: identifier,
        errorMessage: null,
      );
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
    required String dealerCode,
  }) async {
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 2));

    // 1. Validate Dealer Code
    if (!_validDealerCodes.contains(dealerCode.toUpperCase())) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Invalid Dealer Code.",
      );
      return;
    }

    // 2. Validate Mobile Number (Simple check for 10 digits)
    if (phone.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(phone)) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Please enter a valid 10-digit mobile number.",
      );
      return;
    }

    // 3. Validate Email
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(email)) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Please enter a valid email address.",
      );
      return;
    }

    // If all validations pass, proceed with registration

    // Register user in memory
    _userRegistry[phone] = password;

    // Update profile provider
    _ref.read(profileProvider.notifier).updateProfile(
      name: name,
      email: email,
      phone: phone,
      companyName: 'Authorized Fogshield Partner',
      dealerId: dealerCode.toUpperCase(),
    );

    // Set status to signedUp to redirect to login
    state = state.copyWith(
      status: AuthStatus.signedUp,
      errorMessage: null,
    );
  }

  Future<void> logout() async {
    // Clear storage
    await SecureStorageService.clearSession();
    // Update state to unauthenticated
    state = AuthState.initial().copyWith(status: AuthStatus.unauthenticated);
  }

  // Method to reset error state after showing toast
  void clearError() {
    if (state.status == AuthStatus.error) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: null,
      );
    }
  }

  // Method to reset signedUp state after navigation
  void clearSignedUp() {
    if (state.status == AuthStatus.signedUp) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: null,
      );
    }
  }
}