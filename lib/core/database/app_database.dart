import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'app_database_tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Products, Quotations, QuotationItems, DealerProfile])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 3) {
          await m.addColumn(quotations, quotations.notes);
        }
      },
    );
  }

  // --- QUOTATION HISTORY (Offline-First) ---

  /// Watches the entire quotation history, sorted by creation date (newest first)
  Stream<List<Quotation>> watchQuotationHistory() =>
      (select(quotations)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();

  /// Saves or updates a quotation and its associated line items within a single transaction
  Future<void> saveFullQuotation(Quotation quote, List<QuotationItemsCompanion> items) async {
    await transaction(() async {
      // 1. Insert or update the main quotation record
      await into(quotations).insertOnConflictUpdate(quote);

      // 2. Clean up existing items for this quotation to prevent duplicates on update
      await (delete(quotationItems)..where((t) => t.quotationId.equals(quote.id))).go();

      // 3. Batch insert the new set of quotation items
      await batch((batch) => batch.insertAll(quotationItems, items));
    });
  }

  /// Retrieves all line items associated with a specific quotation ID
  Future<List<QuotationItem>> getItemsForQuotation(String quoteId) =>
      (select(quotationItems)..where((t) => t.quotationId.equals(quoteId))).get();

  // --- SYNC ENGINE HELPERS ---

  /// Fetches quotations that need syncing (LocalOnly OR Failed attempts)
  /// This ensures that if a previous sync failed, it gets retried.
  Future<List<Quotation>> getQuotationsForSync() {
    return (select(quotations)
      ..where((t) => t.syncStatus.isIn([
        SyncStatus.localOnly.index,
        SyncStatus.failed.index,
      ])))
        .get();
  }

  /// Updates a local quotation with its server-side ID and marks it as synced
  Future<void> markAsSynced(String localId, String? serverId) {
    return (update(quotations)..where((t) => t.id.equals(localId))).write(
      QuotationsCompanion(
        remoteId: Value(serverId),
        syncStatus: const Value(SyncStatus.synced),
      ),
    );
  }

  /// Updates the synchronization status of a specific quotation
  Future<void> updateSyncStatus(String localId, SyncStatus status) {
    return (update(quotations)..where((t) => t.id.equals(localId))).write(
      QuotationsCompanion(syncStatus: Value(status)),
    );
  }
}

/// Helper function to locate and open the SQLite database file on the device
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fogshield_dealer_v1.sqlite'));
    return NativeDatabase(file);
  });
}