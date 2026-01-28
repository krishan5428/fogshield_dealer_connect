import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;

// List of authorized dealer codes
  final List<String> _validDealerCodes = [
    'SECDLR001',
    'SECDLR002',
    'SECDLR003',
    'SECDLR004',
    'SECDLR005',
  ];

// In-memory "database" to store newly signed-up users
  final Map<String, String> _userRegistry = {
    "7562095494": "123456", // Default Admin
  };

  AuthNotifier(this._ref) : super(AuthState.initial()) {
    _checkAuthStatus();
  }

  /// Checks secure storage for a persisted session on startup
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

  /// Login logic
  Future<void> login(String identifier, String password) async {
    state = state.copyWith(status: AuthStatus.loading);

    await Future.delayed(const Duration(seconds: 2));

// Check if it's a registered phone or a valid Dealer Code used as username
    bool isRegisteredUser = _userRegistry.containsKey(identifier) && _userRegistry[identifier] == password;
    bool isValidDealerCode = _validDealerCodes.contains(identifier.toUpperCase()) && password == "123456";

    if (isRegisteredUser || isValidDealerCode) {
      await SecureStorageService.saveLoginSession(identifier);

      state = state.copyWith(
        status: AuthStatus.authenticated,
        phoneNumber: identifier,
      );
    } else {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Invalid credentials.",
      );
    }


  }

  /// Signup logic: Validates code, registers user, and updates profile data
  Future<void> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String dealerCode,
  }) async {
    state = state.copyWith(status: AuthStatus.loading);

    await Future.delayed(const Duration(seconds: 2));

// Validate Dealer Code - Show only "Incorrect Dealer Code" as requested
    if (!_validDealerCodes.contains(dealerCode.toUpperCase())) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Incorrect Dealer Code.",
      );
      return;
    }

// Register the new credentials locally
    _userRegistry[phone] = password;

// Push the EXACT data from signup to the Profile Provider
    _ref.read(profileProvider.notifier).updateProfile(
      name: name,
      email: email,
      phone: phone,
      companyName: 'Authorized Fogshield Partner',
      dealerId: dealerCode.toUpperCase(), // Store the code used to register
    );

// Persist the session
    await SecureStorageService.saveLoginSession(phone);

    state = state.copyWith(
      status: AuthStatus.authenticated,
      phoneNumber: phone,
    );


  }

  /// Logout logic
  Future<void> logout() async {
    await SecureStorageService.clearSession();
    state = AuthState.initial().copyWith(status: AuthStatus.unauthenticated);
  }
}