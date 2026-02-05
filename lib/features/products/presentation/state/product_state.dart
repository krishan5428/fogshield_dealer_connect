import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:fogshield_dealer_connect/core/api/api_constants.dart';
import 'package:fogshield_dealer_connect/features/products/presentation/widgets/product_model.dart';

// Initialize Logger
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
    errorMethodCount: 5,
    lineLength: 80,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

// Provider for fetching products - STRICT SERVER MODE
final productsProvider = FutureProvider.autoDispose<List<Product>>((ref) async {
  final url = Uri.parse(ApiConstants.getProducts);

  logger.i("🚀 API Request: GET $url");

  try {
    final response = await http.get(url).timeout(ApiConstants.timeoutDuration);

    // DEBUG: Print raw body length and content to identify "empty response" issues
    logger.d("📥 Status: ${response.statusCode}, Body Length: ${response.body.length}");

    if (response.statusCode != 200) {
      logger.e("❌ API Error: HTTP ${response.statusCode}");
      throw Exception('Server returned status ${response.statusCode}');
    }

    // CRITICAL FIX: Check for empty body specifically to avoid "Unexpected end of input"
    if (response.body.trim().isEmpty) {
      logger.e("❌ API Error: Empty response body");
      throw Exception('Server returned an empty response. (Possible PHP Fatal Error or DB Connection issue)');
    }

    try {
      final Map<String, dynamic> body = jsonDecode(response.body);

      if (body['status'] != true) {
        logger.e("❌ API Business Logic Error: ${body['msg']}");
        throw Exception(body['msg'] ?? 'Unknown server error');
      }

      final List<dynamic> data = body['data'];
      logger.d("✅ API Success: Received ${data.length} records");

      Map<String, dynamic> serverDataMap = {};
      for (var item in data) {
        if (item['s_no'] != null) {
          serverDataMap[item['s_no'].toString()] = item;
        }
      }

      final List<Product> mergedProducts = fogShieldProducts.map((localProduct) {
        final serverItem = serverDataMap[localProduct.sNo];

        if (serverItem != null) {
          return localProduct.copyWith(
            name: serverItem['name'] ?? localProduct.name,
            endUserPrice: (serverItem['end_user_price'] is num)
                ? (serverItem['end_user_price'] as num).toDouble()
                : 0.0,
            mrp: (serverItem['mrp'] is num)
                ? (serverItem['mrp'] as num).toDouble()
                : 0.0,
          );
        }
        return localProduct;
      }).toList();

      return mergedProducts;

    } catch (e) {
      if (e is FormatException) {
        logger.e("❌ JSON Parse Error. Raw Body: ${response.body}");
        throw Exception('Invalid JSON format from server.');
      }
      rethrow;
    }

  } catch (e, stack) {
    logger.e("🚨 Critical Failure: Unable to load pricing", error: e, stackTrace: stack);
    throw Exception(e.toString().replaceAll('Exception: ', ''));
  }
});