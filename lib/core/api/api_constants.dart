class ApiConstants {
  ApiConstants._();

  static const Duration timeoutDuration = Duration(seconds: 18);
  static const String baseUrl = 'https://securicoconnect.com/cms/apps/Securico/app_services/fogshield_dealer_connect';

  // --- Auth & Profile ---
  static const String login = '$baseUrl/fogshield_dealer_login.php';
  static const String signup = '$baseUrl/fogshield_dealer_signup.php';
  static const String updateProfile = '$baseUrl/fogshield_dealer_update.php';

  // --- Products ---
  static const String getProducts = '$baseUrl/fogshield_get_products.php';

  // --- Quotations ---
  static const String saveQuotation = '$baseUrl/fogshield_dealer_save_quote.php';
}