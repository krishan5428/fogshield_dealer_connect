import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/utils/logger_service.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/auth/data/auth_repository.dart';
import 'package:fogshield_dealer_connect/features/auth/presentation/state/auth_state.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/providers/profile_providers.dart';

// 1. Provider for the Repository
final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository();
});

// 2. The main Auth StateNotifierProvider
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final Ref _ref;

  // Access the repository using the ref
  AuthRepository get _repository => _ref.read(authRepositoryProvider);

  AuthNotifier(this._ref) : super(AuthState.initial()) {
    checkAuthStatus();
  }

  /// Checks if the user is already logged in (persisted session)
  Future<void> checkAuthStatus() async {
    LoggerService.i("🔒 Checking Auth Status...");
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

  /// Handles Login logic
  Future<void> login(String identifier, String password) async {
    LoggerService.i("🔑 Login Attempt: $identifier");
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      // Call the API via Repository
      final response = await _repository.login(
        mobile: identifier,
        password: password,
        deviceId: "device_id_placeholder",
      );

      final bool isSuccess = (response['success'] == true) || (response['status'] == true);

      if (isSuccess) {
        // Handle User Data extraction (supports 'user' or 'data' key)
        final userData = response['user'] ?? response['data'];
        LoggerService.i("✅ Login Success for User: ${userData['name']}");

        // --- NEW: Extract Profile Data including ID ---
        final userId = userData['id']?.toString() ?? ''; // ✅ Extracting ID
        final name = userData['name']?.toString() ?? 'Partner';
        final email = userData['email']?.toString() ?? '';
        final phone = userData['mobile_number']?.toString() ?? identifier;
        final companyName = userData['company_name']?.toString() ?? '';
        final dealerCode = userData['dealer_code']?.toString() ?? '';
        final gstNumber = userData['gst_number']?.toString() ?? '';
        final address = userData['address']?.toString() ?? '';

        // 1. Update Profile Provider
        // We use updateProfile directly. It handles:
        // - Updating State
        // - Persisting to Secure Storage
        // - Triggering Background Sync (if needed)
        await _ref.read(profileProvider.notifier).updateProfile(
          userId: userId, // ✅ Passing the userId here
          name: name,
          email: email,
          phone: phone,
          companyName: companyName,
          dealerId: dealerCode,
          gstNumber: gstNumber,
          address: address,
        );

        // 2. Save session flag
        await SecureStorageService.saveLoginSession(identifier);

        // Update State
        state = state.copyWith(
          status: AuthStatus.authenticated,
          phoneNumber: identifier,
          errorMessage: null,
        );
      } else {
        // Handle API Failure Message
        final errorMsg = response['message'] ?? response['msg'] ?? "Invalid credentials.";
        LoggerService.w("⚠️ Login Failed: $errorMsg");

        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: errorMsg,
        );
      }
    } catch (e) {
      LoggerService.e("❌ Login Error: $e", e);
      // Handle Network/Server Errors
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Connection failed. Please check your internet.",
      );
    }
  }

  /// Handles Signup logic
  Future<void> signup({
    required String name,
    required String phone,
    required String email,
    required String password,
    required String dealerCode,
    required String gstNumber,
    required String address,
  }) async {
    LoggerService.i("📝 Signup Attempt: $name ($phone)");
    state = state.copyWith(status: AuthStatus.loading, errorMessage: null);

    try {
      final response = await _repository.signup(
        name: name,
        mobile: phone,
        email: email,
        password: password,
        dealerCode: dealerCode,
        gstNumber: gstNumber,
        address: address,
      );

      // Check for success (handling both possible keys)
      final bool isSuccess = (response['success'] == true) || (response['status'] == true);

      if (isSuccess) {
        // Pre-fill the profile provider so the user doesn't see empty screens
        // Note: userId might be empty here until they actually login and get it from DB
        await _ref.read(profileProvider.notifier).updateProfile(
          name: name,
          email: email,
          phone: phone,
          companyName: 'Authorized Fogshield Partner',
          dealerId: dealerCode.toUpperCase(),
          gstNumber: gstNumber,
          address: address,
        );

        LoggerService.i("✅ Signup Success: $name");

        state = state.copyWith(
          status: AuthStatus.signedUp,
          errorMessage: null,
        );
      } else {
        final errorMsg = response['message'] ?? response['msg'] ?? "Registration failed.";
        LoggerService.w("⚠️ Signup Failed: $errorMsg");

        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: errorMsg,
        );
      }
    } catch (e) {
      LoggerService.e("❌ Signup Error: $e", e);
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: "Connection failed. Please try again later.",
      );
    }
  }

  Future<void> logout() async {
    LoggerService.i("👋 User Logging Out");
    await SecureStorageService.clearSession();
    state = AuthState.initial().copyWith(status: AuthStatus.unauthenticated);
  }

  void clearError() {
    if (state.status == AuthStatus.error) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: null,
      );
    }
  }

  void clearSignedUp() {
    if (state.status == AuthStatus.signedUp) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        errorMessage: null,
      );
    }
  }
}