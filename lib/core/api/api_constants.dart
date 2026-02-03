class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  // Base URL
  static const String baseUrl = 'https://securicoconnect.com/cms/apps/Securico/app_services';

  // --- Auth Endpoints ---
  static const String login = '$baseUrl/fogshield_dealer_login.php';
  static const String signup = '$baseUrl/fogshield_dealer_signup.php';

  // --- Profile Endpoints ---
  static const String updateProfile = '$baseUrl/fogshield_dealer_update.php';

// Add future endpoints here (e.g., Products, Quotations, etc.)
}