import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class AuthRepository {
  // Base URL for your API
  static const String _baseUrl = 'https://securicoconnect.com/cms/apps/Securico/app_services';

  /// Login Method
  /// Endpoint: fogshield_dealer_login.php
  Future<Map<String, dynamic>> login({
    required String mobile,
    required String password,
    String deviceId = 'unknown_device',
  }) async {
    final uri = Uri.parse('$_baseUrl/fogshield_dealer_login.php');

    try {
      final response = await http.post(uri, body: {
        'mobile': mobile,
        'pass': password,
        'dev_id': deviceId,
      });

      log('Login API Response: ${response.body}');

      if (response.statusCode == 200) {
        // Parse the JSON string into a Map
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Server returned status: ${response.statusCode}');
      }
    } catch (e) {
      log('Login Exception: $e');
      rethrow;
    }
  }

  /// Signup Method
  /// Endpoint: fogshield_dealer_signup.php
  Future<Map<String, dynamic>> signup({
    required String name,
    required String mobile,
    required String email,
    required String password,
    required String dealerCode,
    required String gstNumber,
    required String address,
    String companyName = 'Authorized Fogshield Partner',
  }) async {
    final uri = Uri.parse('$_baseUrl/fogshield_dealer_signup.php');

    try {
      final response = await http.post(uri, body: {
        'name': name,
        'mobile': mobile, // PHP expects 'mobile'
        'dealer_code': dealerCode,
        'email': email,
        'password': password,
        'gst_number': gstNumber,
        'address': address,
        'company_name': companyName,
      });

      log('Signup API Response: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception('Server returned status: ${response.statusCode}');
      }
    } catch (e) {
      log('Signup Exception: $e');
      rethrow;
    }
  }
}