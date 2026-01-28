import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fogshield_dealer_connect/core/database/app_database.dart';

// Provides a singleton instance of the Drift database
final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

// Streams the quotation history from the database
final quotationHistoryStreamProvider = StreamProvider((ref) {
  return ref.watch(databaseProvider).watchQuotationHistory();
});