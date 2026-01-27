import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  SecureStorageService._();

  static const _storage = FlutterSecureStorage();

// Keys for authentication
  static const String _isLoggedInKey = 'is_logged_in';
  static const String _userPhoneKey = 'user_phone';

// Keys for profile details
  static const String _userNameKey = 'profile_name';
  static const String _userEmailKey = 'profile_email';
  static const String _userCompanyKey = 'profile_company';
  static const String _userAddressKey = 'profile_address';
  static const String _userGstKey = 'profile_gst';
  static const String _userDealerIdKey = 'profile_dealer_id';

  /// Saves the login session
  static Future<void> saveLoginSession(String phone) async {
    await _storage.write(key: _isLoggedInKey, value: 'true');
    await _storage.write(key: _userPhoneKey, value: phone);
  }

  /// Saves all profile details to secure storage
  static Future<void> saveProfileData({
    required String name,
    required String email,
    required String phone,
    required String company,
    required String address,
    required String gst,
    required String dealerId,
  }) async {
    await _storage.write(key: _userNameKey, value: name);
    await _storage.write(key: _userEmailKey, value: email);
    await _storage.write(key: _userPhoneKey, value: phone);
    await _storage.write(key: _userCompanyKey, value: company);
    await _storage.write(key: _userAddressKey, value: address);
    await _storage.write(key: _userGstKey, value: gst);
    await _storage.write(key: _userDealerIdKey, value: dealerId);
  }

  /// Retrieves all profile details
  static Future<Map<String, String?>> getProfileData() async {
    return {
      'name': await _storage.read(key: _userNameKey),
      'email': await _storage.read(key: _userEmailKey),
      'phone': await _storage.read(key: _userPhoneKey),
      'company': await _storage.read(key: _userCompanyKey),
      'address': await _storage.read(key: _userAddressKey),
      'gst': await _storage.read(key: _userGstKey),
      'dealerId': await _storage.read(key: _userDealerIdKey),
    };
  }

  static Future<void> clearSession() async {
    await _storage.deleteAll();
  }

  static Future<bool> isLoggedIn() async {
    final result = await _storage.read(key: _isLoggedInKey);
    return result == 'true';
  }

  static Future<String?> getStoredPhone() async {
    return await _storage.read(key: _userPhoneKey);
  }
}