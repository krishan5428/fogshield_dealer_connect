enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final String? errorMessage;
  final bool rememberMe;
// Added to store user info if needed
  final String? phoneNumber;

  AuthState({
    required this.status,
    this.errorMessage,
    this.rememberMe = false,
    this.phoneNumber,
  });

  factory AuthState.initial() => AuthState(status: AuthStatus.initial);

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    bool? rememberMe,
    String? phoneNumber,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      rememberMe: rememberMe ?? this.rememberMe,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}