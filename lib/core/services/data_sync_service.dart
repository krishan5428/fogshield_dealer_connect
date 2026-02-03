import 'package:flutter/foundation.dart';
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
  /// 2. Quotation Sync (if unsynced)
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

  /// Helper: Reconstructs profile from storage and tries to sync
  Future<void> _retryProfileSyncIfNeeded() async {
    final isDirty = await SecureStorageService.isProfileDirty();
    if (!isDirty) return;

    LoggerService.i("🔄 Found pending profile changes. Retrying sync...");
    final data = await SecureStorageService.getProfileData();

    // Ensure we have minimal valid data to sync
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

  /// Silently syncs profile. If successful, clears the 'dirty' flag.
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
        // Mark as synced so we don't retry unnecessarily
        await SecureStorageService.setProfileDirty(false);
      } else {
        LoggerService.w("⚠️ Silent Sync Warning: Server returned ${response.statusCode}");
      }
    } catch (e) {
      LoggerService.e("❌ Silent Sync Error: $e (Will retry later)", e);
      // We do NOT clear the dirty flag here, so it stays 'true' for retry
    }
  }

  /// ----------------------------------------------------------------
  /// QUOTATION SYNC LOGIC
  /// ----------------------------------------------------------------

  Future<void> _syncPendingQuotations() async {
    final pending = await _db.getUnsyncedQuotations();

    if (pending.isNotEmpty) {
      LoggerService.i("📄 Found ${pending.length} pending quotations.");
    }

    for (var quote in pending) {
      try {
        final items = await _db.getItemsForQuotation(quote.id);

        // --- Placeholder for API logic ---
        // For now, we mock the server response
        // final serverId = await myApi.upload(quote, items);
        final String mockServerId = "REMOTE_${quote.id}";

        await _db.markAsSynced(quote.id, mockServerId);
        LoggerService.i("✅ Quote ${quote.id} synced.");
      } catch (e) {
        await _db.updateSyncStatus(quote.id, SyncStatus.failed);
        LoggerService.e("❌ Quote ${quote.id} sync failed.", e);
      }
    }
  }

  Future<void> syncCatalogFromServer() async {
    // Implementation for pulling master product list
  }
}