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
  int get schemaVersion => 1;

  // --- QUOTATION HISTORY (Offline-First) ---

  Stream<List<Quotation>> watchQuotationHistory() =>
      (select(quotations)..orderBy([(t) => OrderingTerm.desc(t.createdAt)])).watch();

  Future<void> saveFullQuotation(Quotation quote, List<QuotationItemsCompanion> items) async {
    await transaction(() async {
      await into(quotations).insertOnConflictUpdate(quote);
      await (delete(quotationItems)..where((t) => t.quotationId.equals(quote.id))).go();
      await batch((batch) => batch.insertAll(quotationItems, items));
    });
  }

  Future<List<QuotationItem>> getItemsForQuotation(String quoteId) =>
      (select(quotationItems)..where((t) => t.quotationId.equals(quoteId))).get();

  // --- SYNC ENGINE HELPERS (Fixed method names for Sync Service) ---

  Future<List<Quotation>> getUnsyncedQuotations() =>
      (select(quotations)..where((t) => t.syncStatus.equals(SyncStatus.localOnly.index))).get();

  Future<void> markAsSynced(String localId, String? serverId) {
    return (update(quotations)..where((t) => t.id.equals(localId))).write(
      QuotationsCompanion(
        remoteId: Value(serverId),
        syncStatus: const Value(SyncStatus.synced),
      ),
    );
  }

  Future<void> updateSyncStatus(String localId, SyncStatus status) {
    return (update(quotations)..where((t) => t.id.equals(localId))).write(
      QuotationsCompanion(syncStatus: Value(status)),
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fogshield_dealer_v1.sqlite'));
    return NativeDatabase(file);
  });
}