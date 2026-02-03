import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/api/api_constants.dart';
import 'package:http/http.dart' as http;
import 'package:fogshield_dealer_connect/core/utils/logger_service.dart';
import 'package:fogshield_dealer_connect/core/utils/storage_service.dart';
import 'package:fogshield_dealer_connect/features/profile/presentation/state/profile_state.dart';
import '../database/app_database.dart';
import '../database/app_database_tables.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
final syncServiceProvider = Provider((ref) => DataSyncService(ref));

class DataSyncService {
  final Ref _ref;
  DataSyncService(this._ref);

  AppDatabase get _db => _ref.read(databaseProvider);

  /// MASTER SYNC FUNCTION
  /// Runs:
  /// 1. Profile Sync (if dirty)
  /// 2. Quotation Sync (if unsynced or failed previously)
  Future<void> performBackgroundSync() async {
    LoggerService.i("📡 Sync Service: Starting sync cycle...");

    // Step 1: Sync Profile if needed
    await _retryProfileSyncIfNeeded();

    // Step 2: Sync Quotations
    await _syncPendingQuotations();

    LoggerService.i("🏁 Sync Service: Cycle complete.");
  }

  /// ----------------------------------------------------------------
  /// PROFILE SYNC LOGIC
  /// ----------------------------------------------------------------

  Future<void> _retryProfileSyncIfNeeded() async {
    final isDirty = await SecureStorageService.isProfileDirty();
    if (!isDirty) return;

    LoggerService.i("🔄 Found pending profile changes. Retrying sync...");
    final data = await SecureStorageService.getProfileData();

    if (data['userId'] == null) return;

    final profile = ProfileState(
      userId: data['userId']!,
      name: data['name'] ?? '',
      email: data['email'] ?? '',
      phone: data['phone'] ?? '',
      companyName: data['company'] ?? '',
      address: data['address'] ?? '',
      gstNumber: data['gst'] ?? '',
      dealerId: data['dealerId'] ?? '',
    );

    await syncUserProfile(profile);
  }

  Future<void> syncUserProfile(ProfileState profile) async {
    if (profile.userId.isEmpty) return;

    try {
      final response = await http.post(
        Uri.parse(ApiConstants.updateProfile),
        body: {
          'user_id': profile.userId,
          'name': profile.name,
          'email': profile.email,
          'address': profile.address,
          'company_name': profile.companyName,
          'gst_number': profile.gstNumber,
        },
      );

      if (response.statusCode == 200) {
        LoggerService.i("✅ Silent Sync Success: Profile updated on server.");
        await SecureStorageService.setProfileDirty(false);
      } else {
        LoggerService.w("⚠️ Silent Sync Warning: Server returned ${response.statusCode}");
      }
    } catch (e) {
      LoggerService.e("❌ Silent Sync Error: $e (Will retry later)", e);
    }
  }

  /// ----------------------------------------------------------------
  /// QUOTATION SYNC LOGIC
  /// ----------------------------------------------------------------

  Future<void> _syncPendingQuotations() async {
    // Fetch quotes that are LocalOnly or Failed to retry them
    final pending = await _db.getQuotationsForSync();

    if (pending.isEmpty) return;

    LoggerService.i("📄 Found ${pending.length} pending quotations for upload.");

    // Retrieve User ID from Secure Storage to link the quotation
    final profileData = await SecureStorageService.getProfileData();
    final userId = profileData['userId'];

    if (userId == null || userId.isEmpty) {
      LoggerService.e("❌ Sync Aborted: No User ID found in storage. Cannot upload quotations.");
      return;
    }

    for (var quote in pending) {
      // Mark as syncing in UI (Optional, handled by riverpod async value usually)
      await _db.updateSyncStatus(quote.id, SyncStatus.syncing);

      try {
        final items = await _db.getItemsForQuotation(quote.id);

        // Construct Payload matching server expectations
        final payload = {
          "user_id": userId,
          "quotation_id": quote.id,
          "customer_name": quote.customerName,
          "customer_phone": quote.phoneNumber,
          "customer_email": quote.email,
          "company_name": quote.companyName,
          "gst_number": quote.gstNumber,
          "billing_address": quote.billingAddress,
          "billing_city": quote.billingCity,
          "billing_state": quote.billingState,
          "billing_pincode": quote.billingPincode,
          "shipping_address": quote.shippingAddress,
          "shipping_city": quote.shippingCity,
          "shipping_state": quote.shippingState,
          "shipping_pincode": quote.shippingPincode,
          "total_amount": quote.totalAmount,
          "notes": quote.notes,
          "created_at": quote.createdAt.toIso8601String(),
          "items": items.map((item) => {
            "product_model": item.productModel,
            "quantity": item.quantity,
            "price": item.priceAtTimeOfSale,
          }).toList(),
        };

        LoggerService.d("📤 Uploading Quote ${quote.id}...");

        final response = await http.post(
          Uri.parse(ApiConstants.saveQuotation),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(payload),
        );

        if (response.statusCode == 200) {
          final responseData = jsonDecode(response.body);

          // Assuming server returns the remote ID in 'id' or 'server_id'
          final remoteId = responseData['id']?.toString() ?? responseData['server_id']?.toString();

          await _db.markAsSynced(quote.id, remoteId ?? "SERVER_ACK_${DateTime.now().millisecondsSinceEpoch}");
          LoggerService.i("✅ Quote ${quote.id} synced successfully.");
        } else {
          throw Exception("Server Error: ${response.statusCode} - ${response.body}");
        }

      } catch (e) {
        await _db.updateSyncStatus(quote.id, SyncStatus.failed);
        LoggerService.e("❌ Quote ${quote.id} upload failed.", e);
      }
    }
  }
}