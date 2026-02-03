class ApiConstants {
  // Private constructor to prevent instantiation
  ApiConstants._();

  static const Duration timeoutDuration = Duration(seconds: 18);

  // FIX: Updated Base URL to point to the 'fogshield_dealer_connect' folder
  static const String baseUrl = 'https://securicoconnect.com/cms/apps/Securico/app_services/fogshield_dealer_connect';

  // --- Auth Endpoints ---
  static const String login = '$baseUrl/fogshield_dealer_login.php';
  static const String signup = '$baseUrl/fogshield_dealer_signup.php';

  // --- Profile Endpoints ---
  static const String updateProfile = '$baseUrl/fogshield_dealer_update.php';

  // --- Quotation Endpoints ---
  static const String saveQuotation = '$baseUrl/fogshield_dealer_save_quote.php';
}