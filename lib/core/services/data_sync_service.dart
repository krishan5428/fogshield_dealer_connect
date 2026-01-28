import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/app_database.dart';
import '../database/app_database_tables.dart';

final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());
final syncServiceProvider = Provider((ref) => DataSyncService(ref));

class DataSyncService {
  final Ref _ref;
  DataSyncService(this._ref);

  AppDatabase get _db => _ref.read(databaseProvider);

  /// Background Sync: Uploads localOnly quotes to server
  Future<void> performBackgroundSync() async {
    // Fixed: calling corrected method names in AppDatabase
    final pending = await _db.getUnsyncedQuotations();

    for (var quote in pending) {
      try {
        final items = await _db.getItemsForQuotation(quote.id);

        // --- Placeholder for API logic ---
        // final serverId = await myApi.upload(quote, items);
        final String mockServerId = "REMOTE_${quote.id}";

        // Fixed: calling corrected method name in AppDatabase
        await _db.markAsSynced(quote.id, mockServerId);
      } catch (e) {
        await _db.updateSyncStatus(quote.id, SyncStatus.failed);
      }
    }
  }

  Future<void> syncCatalogFromServer() async {
    // Implementation for pulling master product list
  }
}